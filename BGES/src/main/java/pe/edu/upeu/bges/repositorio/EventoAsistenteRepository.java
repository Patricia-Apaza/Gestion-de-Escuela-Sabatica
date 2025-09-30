package pe.edu.upeu.bges.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.upeu.bges.modelo.EventoAsistente;
import java.util.List;

public interface EventoAsistenteRepository extends JpaRepository<EventoAsistente, Long> {
    List<EventoAsistente> findByEventoId(Long eventoId);
    List<EventoAsistente> findByUsuarioId(Long usuarioId);
    void deleteByEventoId(Long eventoId);
}
