package pe.edu.upeu.bges.servicio;

import pe.edu.upeu.bges.dtos.DashboardDto;
import java.util.List;

public interface IDashboardService {
    DashboardDto.EstadisticasGenerales getEstadisticasGenerales();
    List<DashboardDto.RankingGrupo> getRankingGrupos();
    List<DashboardDto.TendenciaAsistencia> getTendenciaAsistencia(int semanas);
    List<DashboardDto.EstudianteBajaAsistencia> getEstudiantesBajaAsistencia();
    List<DashboardDto.MetricasFacultad> getMetricasFacultades();
}
