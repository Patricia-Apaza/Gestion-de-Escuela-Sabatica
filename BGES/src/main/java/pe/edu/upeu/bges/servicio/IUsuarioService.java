package pe.edu.upeu.bges.servicio;

import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.modelo.Usuario;
import java.util.List;

public interface IUsuarioService {
    // Autenticación
    UsuarioDto.LoginResponseDto login(UsuarioDto.LoginRequestDto loginRequest);

    // CRUD básico
    Usuario crearUsuario(UsuarioDto.CrearUsuarioDto crearDto);
    Usuario findById(Long id);
    List<Usuario> findAll();
    void delete(Long id);

    // Gestión por roles
    Usuario crearAdmin(UsuarioDto.CrearAdminDto crearDto, Long creadoPor);
    Usuario crearLider(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor);
    Usuario crearIntegrante(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor);

    // Listados
    List<Usuario> listarAdmins();
    List<Usuario> listarLideresPorFacultad(String facultad);
    List<Usuario> listarIntegrantesPorFacultad(String facultad);
    List<Usuario> listarPorFacultadCarrera(String facultad);
    List<Usuario> listarIntegrantesDeGrupo(String grupo);
    List<Usuario> findByRol(Usuario.Rol rol);
    List<Usuario> findByFacultadCarrera(String facultad);

    // Gestión de grupos
    void asignarLiderAGrupo(Long idLider, String grupo, Long modificadoPor);
    void removerLiderDeGrupo(Long idLider, Long modificadoPor);
    Usuario buscarLiderDeGrupo(String grupo);

    // Actualización y gestión
    Usuario actualizarUsuario(UsuarioDto.ActualizarUsuarioDto dto, Long modificadoPor);
    void restablecerContraseña(Long id, String nuevaPassword, Long modificadoPor);
    void bloquearUsuario(Long id, Long bloqueadoPor);
    void desbloquearUsuario(Long id, Long desbloqueadoPor);

    // Accesos temporales
    void otorgarAccesoTemporal(UsuarioDto.AccesoTemporalDto dto, Long otorgadoPor);
    void revocarAccesoTemporal(Long usuarioId, Long revocadoPor);
    List<Usuario> listarAccesosTemporales();

    // Estadísticas
    List<Object[]> getEstadisticasPorRol();
    List<Object[]> getEstadisticasPorFacultad();
}
