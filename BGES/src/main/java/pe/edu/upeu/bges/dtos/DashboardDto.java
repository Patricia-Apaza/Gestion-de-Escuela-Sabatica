package pe.edu.upeu.bges.dtos;

import java.time.LocalDate;

public class DashboardDto {

    // DTO para estadísticas del dashboard principal
    public record EstadisticasGenerales(
            Long totalGrupos,
            Long totalEstudiantes,
            Double porcentajeAsistencia,
            Long estudiantesConBajaAsistencia,
            Double tendenciaAsistenciaSemanal,
            String periodoActual
    ) {}

    // DTO para ranking de grupos
    public record RankingGrupo(
            Long idGrupo,
            String nombreGrupo,
            String nombreLider,
            Double porcentajeAsistencia,
            Long totalIntegrantes,
            String estado
    ) {}

    // DTO para tendencia de asistencia semanal
    public record TendenciaAsistencia(
            LocalDate fecha,
            Double porcentajeAsistencia,
            Long totalPresentes,
            Long totalRegistrados
    ) {}

    // DTO para estudiantes con baja asistencia
    public record EstudianteBajaAsistencia(
            Long idUsuario,
            String nombreCompleto,
            String facultadCarrera,
            String nombreGrupo,
            Double porcentajeAsistencia,
            Integer diasConsecutivosAusente,
            String motivoPrincipalAusencia
    ) {}

    // DTO para métricas por facultad
    public record MetricasFacultad(
            String facultadCarrera,
            Long totalEstudiantes,
            Long totalGrupos,
            Double porcentajeAsistenciaPromedio,
            Long estudiantesActivos,
            Long estudiantesConAlertas
    ) {}
}
