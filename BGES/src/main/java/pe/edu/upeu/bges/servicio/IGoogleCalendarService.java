package pe.edu.upeu.bges.servicio;

import pe.edu.upeu.bges.dtos.CalendarioDto;
import java.util.List;

public interface IGoogleCalendarService {

    // Crear evento
    CalendarioDto.EventoDto crearEvento(CalendarioDto.CrearEventoDto eventoDto);

    // Listar eventos
    List<CalendarioDto.EventoDto> listarEventos(CalendarioDto.ListarEventosDto filtros);

    // Obtener evento por ID
    CalendarioDto.EventoDto obtenerEvento(String idEvento);

    // Actualizar evento
    CalendarioDto.EventoDto actualizarEvento(CalendarioDto.ActualizarEventoDto eventoDto);

    // Eliminar evento
    void eliminarEvento(String idEvento);

    // Obtener eventos del día
    List<CalendarioDto.EventoDto> obtenerEventosDelDia(java.time.LocalDate fecha);

    // Obtener próximos eventos
    List<CalendarioDto.EventoDto> obtenerProximosEventos(Integer cantidad);
}
