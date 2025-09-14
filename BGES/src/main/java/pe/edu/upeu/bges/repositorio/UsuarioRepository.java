package pe.edu.upeu.bges.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import pe.edu.upeu.bges.modelo.Usuario;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    // Consultas básicas para autenticación
    Optional<Usuario> findByDni(String dni);
    Optional<Usuario> findByCorreo(String correo);

    // Consultas por rol (para diferentes tipos de listados)
    List<Usuario> findByRol(Usuario.Rol rol);
    List<Usuario> findByRolAndEstado(Usuario.Rol rol, Usuario.Estado estado);

    // Consultas por facultad/carrera (para Admins)
    List<Usuario> findByFacultadCarrera(String facultadCarrera);
    List<Usuario> findByFacultadCarreraAndRol(String facultadCarrera, Usuario.Rol rol);

    // Consultas por grupo (para Líderes)
    List<Usuario> findByGrupoAsignado(String grupoAsignado);
    Optional<Usuario> findByGrupoAsignadoAndRol(String grupoAsignado, Usuario.Rol rol);

    // Consultas para gestión de SuperAdmin
    @Query("SELECT u FROM Usuario u WHERE u.rol = 'ADMIN' AND u.estado IN ('ACTIVO', 'BLOQUEADO')")
    List<Usuario> findAllAdmins();

    // Consultas para accesos temporales
    @Query("SELECT u FROM Usuario u WHERE u.accesoTemporalHasta IS NOT NULL AND u.accesoTemporalHasta > :now")
    List<Usuario> findUsuarioConAccesoTemporal(@Param("now") LocalDateTime now);

    @Modifying
    @Transactional
    @Query("UPDATE Usuario u SET u.accesoTemporalHasta = :fechaVencimiento WHERE u.idUsuario = :idUsuario")
    void otorgarAccesoTemporal(@Param("idUsuario") Long idUsuario, @Param("fechaVencimiento") LocalDateTime fechaVencimiento);

    @Modifying
    @Transactional
    @Query("UPDATE Usuario u SET u.accesoTemporalHasta = NULL WHERE u.idUsuario = :idUsuario")
    void revocarAccesoTemporal(@Param("idUsuario") Long idUsuario);

    // Actualizar último acceso
    @Modifying
    @Transactional
    @Query("UPDATE Usuario u SET u.ultimoAcceso = :fechaAcceso WHERE u.idUsuario = :idUsuario")
    void actualizarUltimoAcceso(@Param("idUsuario") Long idUsuario, @Param("fechaAcceso") LocalDateTime fechaAcceso);

    // Gestión de intentos fallidos
    @Modifying
    @Transactional
    @Query("UPDATE Usuario u SET u.intentosFallidos = u.intentosFallidos + 1 WHERE u.dni = :dni")
    void incrementarIntentosFallidos(@Param("dni") String dni);

    @Modifying
    @Transactional
    @Query("UPDATE Usuario u SET u.intentosFallidos = 0 WHERE u.idUsuario = :idUsuario")
    void resetearIntentosFallidos(@Param("idUsuario") Long idUsuario);

    // Estadísticas para métricas globales (SuperAdmin)
    @Query("SELECT u.rol, COUNT(u) FROM Usuario u WHERE u.estado = 'ACTIVO' GROUP BY u.rol")
    List<Object[]> getEstadisticasPorRol();

    @Query("SELECT u.facultadCarrera, COUNT(u) FROM Usuario u WHERE u.rol IN ('ADMIN', 'LIDER', 'INTEGRANTE') AND u.estado = 'ACTIVO' GROUP BY u.facultadCarrera")
    List<Object[]> getEstadisticasPorFacultad();

    // Validaciones de existencia
    boolean existsByDni(String dni);
    boolean existsByCorreo(String correo);
    boolean existsByDniAndIdUsuarioNot(String dni, Long idUsuario);
    boolean existsByCorreoAndIdUsuarioNot(String correo, Long idUsuario);

    // Consulta para líderes disponibles (sin grupo asignado o para reasignación)
    @Query("SELECT u FROM Usuario u WHERE u.rol = 'LIDER' AND u.facultadCarrera = :facultadCarrera AND u.estado = 'ACTIVO'")
    List<Usuario> findLideresDisponiblesPorFacultad(@Param("facultadCarrera") String facultadCarrera);
}
