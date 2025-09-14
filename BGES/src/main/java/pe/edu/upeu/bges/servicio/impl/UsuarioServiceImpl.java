package pe.edu.upeu.bges.servicio.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.excepciones.ModelNotFoundException;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.repositorio.UsuarioRepository;
import pe.edu.upeu.bges.servicio.IUsuarioService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UsuarioServiceImpl implements IUsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Usuario save(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    @Override
    public Usuario update(Usuario usuario) {
        usuario.setFechaModificacion(LocalDateTime.now());
        return usuarioRepository.save(usuario);
    }

    @Override
    public void delete(Long id) {
        usuarioRepository.deleteById(id);
    }

    @Override
    public Usuario findById(Long id) {
        return usuarioRepository.findById(id)
                .orElseThrow(() -> new ModelNotFoundException("Usuario no encontrado con ID: " + id));
    }

    @Override
    public List<Usuario> findAll() {
        return usuarioRepository.findAll();
    }

    @Override
    public UsuarioDto.LoginResponseDto login(UsuarioDto.LoginRequestDto loginRequest) {
        Optional<Usuario> usuarioOpt = usuarioRepository.findByDni(loginRequest.dni());

        if (usuarioOpt.isEmpty()) {
            return new UsuarioDto.LoginResponseDto(null, null, null, null, null, null, null, false, "Usuario no encontrado", null);
        }

        Usuario usuario = usuarioOpt.get();

        // Verificar intentos fallidos (bloqueo automático después de 5 intentos)
        if (usuario.getIntentosFallidos() >= 5) {
            return new UsuarioDto.LoginResponseDto(null, null, null, null, null, null, null, false, "Usuario bloqueado por intentos fallidos", null);
        }

        if (usuario.getEstado() == Usuario.Estado.BLOQUEADO && !usuario.tieneAccesoTemporalVigente()) {
            return new UsuarioDto.LoginResponseDto(null, null, null, null, null, null, null, false, "Usuario bloqueado", null);
        }

        if (usuario.getEstado() == Usuario.Estado.INACTIVO && !usuario.tieneAccesoTemporalVigente()) {
            return new UsuarioDto.LoginResponseDto(null, null, null, null, null, null, null, false, "Usuario inactivo", null);
        }

        if (!passwordEncoder.matches(loginRequest.contraseña(), usuario.getContraseña())) {
            usuarioRepository.incrementarIntentosFallidos(loginRequest.dni());
            return new UsuarioDto.LoginResponseDto(null, null, null, null, null, null, null, false, "Contraseña incorrecta", null);
        }

        // Reset intentos fallidos en login exitoso
        usuarioRepository.resetearIntentosFallidos(usuario.getIdUsuario());

        // Determinar redirección según el rol
        String redirectTo = switch (usuario.getRol()) {
            case SUPERADMIN -> "/superadmin/dashboard";
            case ADMIN -> "/admin/dashboard";
            case LIDER -> "/lider/dashboard";
            case INTEGRANTE -> "/integrante/cronograma";
        };

        return new UsuarioDto.LoginResponseDto(
                usuario.getIdUsuario(),
                usuario.getNombreCompleto(),
                usuario.getDni(),
                usuario.getCorreo(),
                usuario.getRol(),
                usuario.getFacultadCarrera(),
                usuario.getGrupoAsignado(),
                true,
                "Login exitoso",
                redirectTo
        );
    }

    @Override
    public void actualizarUltimoAcceso(Long idUsuario) {
        usuarioRepository.actualizarUltimoAcceso(idUsuario, LocalDateTime.now());
    }

    // Operaciones para SuperAdmin
    @Override
    public Usuario crearAdmin(UsuarioDto.CrearAdminDto crearAdminDto, Long creadoPor) {
        if (existsByDni(crearAdminDto.dni())) {
            throw new ModelNotFoundException("Ya existe un usuario con el DNI: " + crearAdminDto.dni());
        }

        if (crearAdminDto.correo() != null && existsByCorreo(crearAdminDto.correo())) {
            throw new ModelNotFoundException("Ya existe un usuario con el correo: " + crearAdminDto.correo());
        }

        Usuario admin = new Usuario();
        admin.setNombreCompleto(crearAdminDto.nombreCompleto());
        admin.setDni(crearAdminDto.dni());
        admin.setCorreo(crearAdminDto.correo());
        admin.setContraseña(passwordEncoder.encode(crearAdminDto.contraseña()));
        admin.setRol(Usuario.Rol.ADMIN);
        admin.setFacultadCarrera(crearAdminDto.facultadCarrera());
        admin.setTelefono(crearAdminDto.telefono());
        admin.setEstado(Usuario.Estado.ACTIVO);
        admin.setCreadoPor(creadoPor);

        return save(admin);
    }

    @Override
    public List<Usuario> listarAdmins() {
        return usuarioRepository.findAllAdmins();
    }

    @Override
    public void otorgarAccesoTemporal(UsuarioDto.AccesoTemporalDto accesoDto, Long otorgadoPor) {
        Usuario usuario = findById(accesoDto.idUsuario());
        usuarioRepository.otorgarAccesoTemporal(accesoDto.idUsuario(), accesoDto.accesoTemporalHasta());

        usuario.setModificadoPor(otorgadoPor);
        update(usuario);
    }

    @Override
    public void revocarAccesoTemporal(Long idUsuario, Long revocadoPor) {
        usuarioRepository.revocarAccesoTemporal(idUsuario);
        Usuario usuario = findById(idUsuario);
        usuario.setModificadoPor(revocadoPor);
        update(usuario);
    }

    @Override
    public List<Usuario> listarAccesosTemporales() {
        return usuarioRepository.findUsuarioConAccesoTemporal(LocalDateTime.now());
    }

    // Operaciones para Admin
    @Override
    public Usuario crearLider(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor) {
        return crearUsuarioPorRol(crearDto, Usuario.Rol.LIDER, creadoPor);
    }

    @Override
    public Usuario crearIntegrante(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor) {
        return crearUsuarioPorRol(crearDto, Usuario.Rol.INTEGRANTE, creadoPor);
    }

    private Usuario crearUsuarioPorRol(UsuarioDto.CrearUsuarioDto crearDto, Usuario.Rol rol, Long creadoPor) {
        if (existsByDni(crearDto.dni())) {
            throw new ModelNotFoundException("Ya existe un usuario con el DNI: " + crearDto.dni());
        }

        if (crearDto.correo() != null && existsByCorreo(crearDto.correo())) {
            throw new ModelNotFoundException("Ya existe un usuario con el correo: " + crearDto.correo());
        }

        Usuario usuario = new Usuario();
        usuario.setNombreCompleto(crearDto.nombreCompleto());
        usuario.setDni(crearDto.dni());
        usuario.setCorreo(crearDto.correo());
        usuario.setContraseña(passwordEncoder.encode(crearDto.contraseña()));
        usuario.setRol(rol);
        usuario.setFacultadCarrera(crearDto.facultadCarrera());
        usuario.setGrupoAsignado(crearDto.grupoAsignado());
        usuario.setTelefono(crearDto.telefono());
        usuario.setFechaNacimiento(crearDto.fechaNacimiento());
        usuario.setDireccion(crearDto.direccion());
        usuario.setObservaciones(crearDto.observaciones());
        usuario.setEstado(Usuario.Estado.ACTIVO);
        usuario.setCreadoPor(creadoPor);

        return save(usuario);
    }

    @Override
    public List<Usuario> listarPorFacultadCarrera(String facultadCarrera) {
        return usuarioRepository.findByFacultadCarrera(facultadCarrera);
    }

    @Override
    public List<Usuario> listarLideresPorFacultad(String facultadCarrera) {
        return usuarioRepository.findLideresDisponiblesPorFacultad(facultadCarrera);
    }

    @Override
    public List<Usuario> listarIntegrantesPorFacultad(String facultadCarrera) {
        return usuarioRepository.findByFacultadCarreraAndRol(facultadCarrera, Usuario.Rol.INTEGRANTE);
    }

    @Override
    public void asignarLiderAGrupo(Long idLider, String grupoAsignado, Long modificadoPor) {
        Usuario lider = findById(idLider);

        if (lider.getRol() != Usuario.Rol.LIDER) {
            throw new ModelNotFoundException("El usuario no es un líder");
        }

        lider.setGrupoAsignado(grupoAsignado);
        lider.setModificadoPor(modificadoPor);
        update(lider);
    }

    @Override
    public void removerLiderDeGrupo(Long idLider, Long modificadoPor) {
        Usuario lider = findById(idLider);
        lider.setGrupoAsignado(null);
        lider.setModificadoPor(modificadoPor);
        update(lider);
    }

    // Operaciones para Líder
    @Override
    public List<Usuario> listarIntegrantesDeGrupo(String grupoAsignado) {
        return usuarioRepository.findByGrupoAsignado(grupoAsignado);
    }

    @Override
    public Usuario buscarLiderDeGrupo(String grupoAsignado) {
        return usuarioRepository.findByGrupoAsignadoAndRol(grupoAsignado, Usuario.Rol.LIDER)
                .orElseThrow(() -> new ModelNotFoundException("No se encontró líder para el grupo: " + grupoAsignado));
    }

    // Operaciones comunes
    @Override
    public Usuario actualizarUsuario(UsuarioDto.ActualizarUsuarioDto actualizarDto, Long modificadoPor) {
        Usuario usuario = findById(actualizarDto.idUsuario());

        if (!usuario.getDni().equals(actualizarDto.dni()) && existsByDni(actualizarDto.dni())) {
            throw new ModelNotFoundException("Ya existe otro usuario con el DNI: " + actualizarDto.dni());
        }

        if (actualizarDto.correo() != null &&
                !actualizarDto.correo().equals(usuario.getCorreo()) &&
                existsByCorreo(actualizarDto.correo())) {
            throw new ModelNotFoundException("Ya existe otro usuario con el correo: " + actualizarDto.correo());
        }

        usuario.setNombreCompleto(actualizarDto.nombreCompleto());
        usuario.setDni(actualizarDto.dni());
        usuario.setCorreo(actualizarDto.correo());
        usuario.setRol(actualizarDto.rol());
        usuario.setEstado(actualizarDto.estado());
        usuario.setFacultadCarrera(actualizarDto.facultadCarrera());
        usuario.setGrupoAsignado(actualizarDto.grupoAsignado());
        usuario.setTelefono(actualizarDto.telefono());
        usuario.setFechaNacimiento(actualizarDto.fechaNacimiento());
        usuario.setDireccion(actualizarDto.direccion());
        usuario.setObservaciones(actualizarDto.observaciones());
        usuario.setModificadoPor(modificadoPor);

        return update(usuario);
    }

    @Override
    public void bloquearUsuario(Long idUsuario, Long modificadoPor) {
        Usuario usuario = findById(idUsuario);
        usuario.setEstado(Usuario.Estado.BLOQUEADO);
        usuario.setModificadoPor(modificadoPor);
        update(usuario);
    }

    @Override
    public void desbloquearUsuario(Long idUsuario, Long modificadoPor) {
        Usuario usuario = findById(idUsuario);
        usuario.setEstado(Usuario.Estado.ACTIVO);
        usuario.setModificadoPor(modificadoPor);
        usuarioRepository.resetearIntentosFallidos(idUsuario);
        update(usuario);
    }

    @Override
    public void restablecerContraseña(Long idUsuario, String nuevaContraseña, Long modificadoPor) {
        Usuario usuario = findById(idUsuario);
        usuario.setContraseña(passwordEncoder.encode(nuevaContraseña));
        usuario.setModificadoPor(modificadoPor);
        usuarioRepository.resetearIntentosFallidos(idUsuario);
        update(usuario);
    }

    @Override
    public boolean existsByDni(String dni) {
        return usuarioRepository.existsByDni(dni);
    }

    @Override
    public boolean existsByCorreo(String correo) {
        return usuarioRepository.existsByCorreo(correo);
    }

    @Override
    public boolean puedeGestionarUsuario(Long idGestor, Long idUsuario) {
        Usuario gestor = findById(idGestor);
        Usuario usuario = findById(idUsuario);

        return switch (gestor.getRol()) {
            case SUPERADMIN -> true;
            case ADMIN -> usuario.getFacultadCarrera().equals(gestor.getFacultadCarrera());
            case LIDER -> usuario.getGrupoAsignado() != null && usuario.getGrupoAsignado().equals(gestor.getGrupoAsignado());
            case INTEGRANTE -> false;
        };
    }

    @Override
    public List<Object[]> getEstadisticasPorRol() {
        return usuarioRepository.getEstadisticasPorRol();
    }

    @Override
    public List<Object[]> getEstadisticasPorFacultad() {
        return usuarioRepository.getEstadisticasPorFacultad();
    }

    @Override
    public Long contarUsuarioPorRol(Usuario.Rol rol) {
        return (long) usuarioRepository.findByRolAndEstado(rol, Usuario.Estado.ACTIVO).size();
    }

    // Agregar estos métodos a la clase UsuarioServiceImpl existente:

    @Override
    public Usuario crearUsuario(UsuarioDto.CrearUsuarioDto crearUsuarioDto, Long creadoPor) {
        // Método genérico que determina el rol y delega a los métodos específicos
        return switch (crearUsuarioDto.rol()) {
            case ADMIN -> crearAdmin(new UsuarioDto.CrearAdminDto(
                    crearUsuarioDto.nombreCompleto(),
                    crearUsuarioDto.dni(),
                    crearUsuarioDto.correo(),
                    crearUsuarioDto.contraseña(),
                    crearUsuarioDto.facultadCarrera(),
                    crearUsuarioDto.telefono()
            ), creadoPor);
            case LIDER -> crearLider(crearUsuarioDto, creadoPor);
            case INTEGRANTE -> crearIntegrante(crearUsuarioDto, creadoPor);
            default -> throw new ModelNotFoundException("Rol no válido para creación de usuario");
        };
    }

    @Override
    public List<Usuario>findByRol(Usuario.Rol rol) {
        return usuarioRepository.findByRol(rol);
    }

    @Override
    public List<Usuario>findByFacultadCarrera(String facultadCarrera) {
        return usuarioRepository.findByFacultadCarrera(facultadCarrera);
    }
}
