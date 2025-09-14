package pe.edu.upeu.bges.servicio;

import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.modelo.Usuario;
import java.time.LocalDateTime;
import java.util.List;

public interface IUsuarioService {

    // Operaciones CRUD básicas
    Usuario save(Usuario usuario);
    Usuario update(Usuario usuario);
    void delete(Long id);
    Usuario findById(Long id);
    List<Usuario> findAll();

    // Autenticación y gestión de sesión
    UsuarioDto.LoginResponseDto login(UsuarioDto.LoginRequestDto loginRequest);
    void actualizarUltimoAcceso(Long idUsuario);

    // MÉTODOS QUE FALTAN - AGREGADOS:
    Usuario crearUsuario(UsuarioDto.CrearUsuarioDto crearUsuarioDto, Long creadoPor);
    List<Usuario> findByRol(Usuario.Rol rol);
    List<Usuario> findByFacultadCarrera(String facultadCarrera);

    // Operaciones específicas para SuperAdmin
    Usuario crearAdmin(UsuarioDto.CrearAdminDto crearAdminDto, Long creadoPor);
    List<Usuario> listarAdmins();
    void otorgarAccesoTemporal(UsuarioDto.AccesoTemporalDto accesoDto, Long otorgadoPor);
    void revocarAccesoTemporal(Long idUsuario, Long revocadoPor);
    List<Usuario> listarAccesosTemporales();

    // Operaciones para Admin (gestión dentro de su facultad/carrera)
    Usuario crearLider(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor);
    Usuario crearIntegrante(UsuarioDto.CrearUsuarioDto crearDto, Long creadoPor);
    List<Usuario> listarPorFacultadCarrera(String facultadCarrera);
    List<Usuario> listarLideresPorFacultad(String facultadCarrera);
    List<Usuario> listarIntegrantesPorFacultad(String facultadCarrera);
    void asignarLiderAGrupo(Long idLider, String grupoAsignado, Long modificadoPor);
    void removerLiderDeGrupo(Long idLider, Long modificadoPor);

    // Operaciones para Líder (gestión de su grupo)
    List<Usuario> listarIntegrantesDeGrupo(String grupoAsignado);
    Usuario buscarLiderDeGrupo(String grupoAsignado);

    // Operaciones comunes de gestión de usuarios
    Usuario actualizarUsuario(UsuarioDto.ActualizarUsuarioDto actualizarDto, Long modificadoPor);
    void bloquearUsuario(Long idUsuario, Long modificadoPor);
    void desbloquearUsuario(Long idUsuario, Long modificadoPor);
    void restablecerContraseña(Long idUsuario, String nuevaContraseña, Long modificadoPor);

    // Consultas de validación
    boolean existsByDni(String dni);
    boolean existsByCorreo(String correo);
    boolean puedeGestionarUsuario(Long idGestor, Long idUsuario);

    // Estadísticas y métricas
    List<Object[]> getEstadisticasPorRol();
    List<Object[]> getEstadisticasPorFacultad();
    Long contarUsuarioPorRol(Usuario.Rol rol); // CORREGIDO: era "contarUsuarioPorRol"
}
