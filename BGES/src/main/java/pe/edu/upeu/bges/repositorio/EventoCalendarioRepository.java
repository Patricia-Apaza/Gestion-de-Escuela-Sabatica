package pe.edu.upeu.bges.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pe.edu.upeu.bges.modelo.EventoCalendario;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface EventoCalendarioRepository extends JpaRepository<EventoCalendario, Long> {

    Optional<EventoCalendario> findByGoogleEventId(String googleEventId);

    @Query("SELECT e FROM EventoCalendario e WHERE e.fechaInicio >= :inicio AND e.fechaInicio <= :fin ORDER BY e.fechaInicio ASC")
    List<EventoCalendario> findEventosPorRangoFecha(@Param("inicio") LocalDateTime inicio, @Param("fin") LocalDateTime fin);

    List<EventoCalendario> findByFacultadCarrera(String facultadCarrera);

    List<EventoCalendario> findByCreadoPor(Long creadoPor);

    @Query("SELECT e FROM EventoCalendario e WHERE e.fechaInicio >= :ahora ORDER BY e.fechaInicio ASC")
    List<EventoCalendario> findProximosEventos(@Param("ahora") LocalDateTime ahora);
}
