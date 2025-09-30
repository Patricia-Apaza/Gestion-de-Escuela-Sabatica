package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.CalendarioDto;
import pe.edu.upeu.bges.servicio.IGoogleCalendarService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/calendario")
@CrossOrigin(origins = "*")
public class CalendarioController {

    @Autowired
    private IGoogleCalendarService calendarService;

    @PostMapping("/eventos")
    public ResponseEntity<CalendarioDto.EventoDto> crearEvento(
            @RequestBody CalendarioDto.CrearEventoDto eventoDto) {
        CalendarioDto.EventoDto evento = calendarService.crearEvento(eventoDto);
        return ResponseEntity.ok(evento);
    }

    @GetMapping("/eventos")
    public ResponseEntity<List<CalendarioDto.EventoDto>> listarEventos(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime fechaInicio,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime fechaFin,
            @RequestParam(defaultValue = "50") Integer maxResultados,
            @RequestParam(required = false) String buscar) {

        CalendarioDto.ListarEventosDto filtros = new CalendarioDto.ListarEventosDto(
                fechaInicio, fechaFin, maxResultados, buscar
        );

        List<CalendarioDto.EventoDto> eventos = calendarService.listarEventos(filtros);
        return ResponseEntity.ok(eventos);
    }

    @GetMapping("/eventos/{idEvento}")
    public ResponseEntity<CalendarioDto.EventoDto> obtenerEvento(@PathVariable String idEvento) {
        CalendarioDto.EventoDto evento = calendarService.obtenerEvento(idEvento);
        return ResponseEntity.ok(evento);
    }

    @PutMapping("/eventos")
    public ResponseEntity<CalendarioDto.EventoDto> actualizarEvento(
            @RequestBody CalendarioDto.ActualizarEventoDto eventoDto) {
        CalendarioDto.EventoDto evento = calendarService.actualizarEvento(eventoDto);
        return ResponseEntity.ok(evento);
    }

    @DeleteMapping("/eventos/{idEvento}")
    public ResponseEntity<String> eliminarEvento(@PathVariable String idEvento) {
        calendarService.eliminarEvento(idEvento);
        return ResponseEntity.ok("Evento eliminado exitosamente");
    }

    @GetMapping("/eventos/dia/{fecha}")
    public ResponseEntity<List<CalendarioDto.EventoDto>> obtenerEventosDelDia(
            @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fecha) {
        List<CalendarioDto.EventoDto> eventos = calendarService.obtenerEventosDelDia(fecha);
        return ResponseEntity.ok(eventos);
    }

    @GetMapping("/eventos/proximos")
    public ResponseEntity<List<CalendarioDto.EventoDto>> obtenerProximosEventos(
            @RequestParam(defaultValue = "10") Integer cantidad) {
        List<CalendarioDto.EventoDto> eventos = calendarService.obtenerProximosEventos(cantidad);
        return ResponseEntity.ok(eventos);
    }
}
