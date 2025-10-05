package pe.edu.upeu.bges.servicio.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.excepciones.ModelNotFoundException;
import pe.edu.upeu.bges.modelo.Persona;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.repositorio.PersonaRepository;
import pe.edu.upeu.bges.repositorio.UsuarioRepository;
import pe.edu.upeu.bges.security.JwtTokenUtil;
import pe.edu.upeu.bges.servicio.IUsuarioService;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UsuarioServiceImpl implements IUsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PersonaRepository personaRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    @Transactional
    public UsuarioDto.LoginResponseDto login(UsuarioDto.LoginRequestDto loginRequest) {
        Optional<Usuario> usuarioOpt = Optional.empty();
        String identificador = loginRequest.usuario();

        // 1. Intentar buscar por usuario
        usuarioOpt = usuarioRepository.findByUsuario(identificador);

        // 2. Si no se encontró, intentar por correo
        if (usuarioOpt.isEmpty()) {
            usuarioOpt = usuarioRepository.findByCorreo(identificador);
        }

        // 3. Si no se encontró, buscar por DNI en Persona
        if (usuarioOpt.isEmpty()) {
            Optional<Persona> personaOpt = personaRepository.findByDocumentoIdentidad(identificador);
            if (personaOpt.isPresent() && personaOpt.get().getUsuarioId() != null) {
                usuarioOpt = usuarioRepository.findById(personaOpt.get().getUsuarioId());
            }
        }

        // Validar si existe usuario
        if (usuarioOpt.isEmpty()) {
            return new UsuarioDto.LoginResponseDto(
                    null, null, null, null, null, null, null, null,
                    false, "Usuario no encontrado", null, null, 0
            );
        }

        Usuario usuario = usuarioOpt.get();

        // Validar si está activo
        if (!usuario.getActivo()) {
            return new UsuarioDto.LoginResponseDto(
                    null, null, null, null, null, null, null, null,
                    false, "Usuario inactivo", null, null, 0
            );
        }

        // Validar contraseña
        if (!passwordEncoder.matches(loginRequest.contraseña(), usuario.getContraseña())) {
            return new UsuarioDto.LoginResponseDto(
                    null, null, null, null, null, null, null, null,
                    false, "Contraseña incorrecta", null, null, 0
            );
        }

        // Obtener datos de Persona si existe
        Persona persona = personaRepository.findByUsuarioId(usuario.getIdUsuario()).orElse(null);
        String dni = persona != null ? persona.getDocumentoIdentidad() : null;
        String facultad = persona != null ? persona.getFacultad() : null;
        String programaEstudio = persona != null ? persona.getProgramaEstudio() : null;
        String grupo = persona != null && persona.getGrupo() != null ? "Grupo " + persona.getGrupo() : null;

        // Generar token JWT
        String token = jwtTokenUtil.generateToken(usuario);

        // Determinar redirección según rol
        String redirectTo = switch (usuario.getRol()) {
            case SUPERADMIN -> "/superadmin/dashboard";
            case ADMIN -> "/admin/dashboard";
            case LIDER -> "/lider/dashboard";
            case INTEGRANTE -> "/integrante/cronograma";
        };

        // Actualizar último acceso
        usuarioRepository.actualizarUltimoAcceso(usuario.getIdUsuario(), LocalDateTime.now());

        return new UsuarioDto.LoginResponseDto(
                usuario.getIdUsuario(),
                usuario.getUsuario(),
                dni,
                usuario.getCorreo(),
                usuario.getRol(),
                facultad,
                programaEstudio,
                grupo,
                true,
                "Login exitoso",
                redirectTo,
                token,
                5 * 60 * 60
        );
    }

    @Override
    public Usuario crearUsuario(UsuarioDto.CrearUsuarioDto crearDto) {
        if (usuarioRepository.existsByUsuario(crearDto.usuario())) {
            throw new ModelNotFoundException("El usuario ya existe");
        }

        if (crearDto.correo() != null && usuarioRepository.existsByCorreo(crearDto.correo())) {
            throw new ModelNotFoundException("El correo ya está registrado");
        }

        Usuario usuario = new Usuario();
        usuario.setUsuario(crearDto.usuario());
        usuario.setCorreo(crearDto.correo());
        usuario.setContraseña(passwordEncoder.encode(crearDto.contraseña()));
        usuario.setRol(crearDto.rol());
        usuario.setActivo(true);

        return usuarioRepository.save(usuario);
    }

    // ==================== MÉTODOS STUB (Para que compile) ====================

    @Override
    public Usuario findById(Long id) {
        return usuarioRepository.findById(id)
                .orElseThrow(() -> new ModelNotFoundException("Usuario no encontrado"));
    }

    @Override
    public List<Usuario> findAll() {
        return usuarioRepository.findAll();
    }

    @Override
    public void delete(Long id) {
        usuarioRepository.deleteById(id);
    }

    @Override
    public Usuario crearAdmin(UsuarioDto.CrearAdminDto crearDto, Long creadoPor) {
        // TODO: Implementar lógica completa
        throw new ModelNotFoundException("Método no implementado aún");
    }

    @Override
    public Usuario crearLider(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor) {
        // TODO: Implementar
        throw new ModelNotFoundException("Método no implementado aún");
    }

    @Override
    public Usuario crearIntegrante(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor) {
        // TODO: Implementar
        throw new ModelNotFoundException("Método no implementado aún");
    }

    @Override
    public List<Usuario> listarAdmins() {
        return new ArrayList<>();
    }

    @Override
    public List<Usuario> listarLideresPorFacultad(String facultad) {
        return new ArrayList<>();
    }

    @Override
    public List<Usuario> listarIntegrantesPorFacultad(String facultad) {
        return new ArrayList<>();
    }

    @Override
    public List<Usuario> listarPorFacultadCarrera(String facultad) {
        return new ArrayList<>();
    }

    @Override
    public List<Usuario> listarIntegrantesDeGrupo(String grupo) {
        return new ArrayList<>();
    }

    @Override
    public List<Usuario> findByRol(Usuario.Rol rol) {
        return new ArrayList<>();
    }

    @Override
    public List<Usuario> findByFacultadCarrera(String facultad) {
        return new ArrayList<>();
    }

    @Override
    public void asignarLiderAGrupo(Long idLider, String grupo, Long modificadoPor) {
        // TODO: Implementar
    }

    @Override
    public void removerLiderDeGrupo(Long idLider, Long modificadoPor) {
        // TODO: Implementar
    }

    @Override
    public Usuario buscarLiderDeGrupo(String grupo) {
        return null;
    }

    @Override
    public Usuario actualizarUsuario(UsuarioDto.ActualizarUsuarioDto dto, Long modificadoPor) {
        throw new ModelNotFoundException("Método no implementado aún");
    }

    @Override
    public void restablecerContraseña(Long id, String nuevaPassword, Long modificadoPor) {
        Usuario usuario = findById(id);
        usuario.setContraseña(passwordEncoder.encode(nuevaPassword));
        usuarioRepository.save(usuario);
    }

    @Override
    public void bloquearUsuario(Long id, Long bloqueadoPor) {
        Usuario usuario = findById(id);
        usuario.setActivo(false);
        usuarioRepository.save(usuario);
    }

    @Override
    public void desbloquearUsuario(Long id, Long desbloqueadoPor) {
        Usuario usuario = findById(id);
        usuario.setActivo(true);
        usuarioRepository.save(usuario);
    }

    @Override
    public void otorgarAccesoTemporal(UsuarioDto.AccesoTemporalDto dto, Long otorgadoPor) {
        // TODO: Implementar
    }

    @Override
    public void revocarAccesoTemporal(Long usuarioId, Long revocadoPor) {
        // TODO: Implementar
    }

    @Override
    public List<Usuario> listarAccesosTemporales() {
        return new ArrayList<>();
    }

    @Override
    public List<Object[]> getEstadisticasPorRol() {
        return new ArrayList<>();
    }

    @Override
    public List<Object[]> getEstadisticasPorFacultad() {
        return new ArrayList<>();
    }
}
