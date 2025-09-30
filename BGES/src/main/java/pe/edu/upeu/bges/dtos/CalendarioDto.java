package pe.edu.upeu.bges.dtos;

import java.time.LocalDateTime;
import java.util.List;

public class CalendarioDto {

    public record CrearEventoDto(
            String titulo,
            String descripcion,
            LocalDateTime fechaInicio,
            LocalDateTime fechaFin,
            String ubicacion,
            List<String> asistentes, // Lista de correos
            String colorId,
            Boolean recordatorio,
            Integer minutosAntes
    ) {}

    public record EventoDto(
            String idEvento,
            String titulo,
            String descripcion,
            LocalDateTime fechaInicio,
            LocalDateTime fechaFin,
            String ubicacion,
            String estado,
            String enlaceReunion,
            List<AsistenteDto> asistentes
    ) {}

    public record AsistenteDto(
            String email,
            String nombre,
            String estadoRespuesta, // accepted, declined, tentative, needsAction
            Boolean organizador
    ) {}

    public record ActualizarEventoDto(
            String idEvento,
            String titulo,
            String descripcion,
            LocalDateTime fechaInicio,
            LocalDateTime fechaFin,
            String ubicacion,
            List<String> asistentes
    ) {}

    public record ListarEventosDto(
            LocalDateTime fechaInicio,
            LocalDateTime fechaFin,
            Integer maxResultados,
            String palabraClave
    ) {}
}
