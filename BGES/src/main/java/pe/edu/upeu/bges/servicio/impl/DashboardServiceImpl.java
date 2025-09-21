package pe.edu.upeu.bges.servicio.impl;

import org.springframework.stereotype.Service;
import pe.edu.upeu.bges.dtos.DashboardDto;
import pe.edu.upeu.bges.servicio.IDashboardService;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
public class DashboardServiceImpl implements IDashboardService {

    @Override
    public DashboardDto.EstadisticasGenerales getEstadisticasGenerales() {
        // Datos de ejemplo - reemplazar con consultas reales
        return new DashboardDto.EstadisticasGenerales(
                12L,     // totalGrupos
                350L,    // totalEstudiantes
                85.0,    // porcentajeAsistencia
                15L,     // estudiantesConBajaAsistencia
                2.5,     // tendenciaAsistenciaSemanal
                "2024-1" // periodoActual
        );
    }

    @Override
    public List<DashboardDto.RankingGrupo> getRankingGrupos() {
        List<DashboardDto.RankingGrupo> ranking = new ArrayList<>();

        ranking.add(new DashboardDto.RankingGrupo(
                1L, "Grupo A", "Líder López", 95.0, 12L, "ACTIVO"
        ));

        ranking.add(new DashboardDto.RankingGrupo(
                2L, "Grupo B", "Líder García", 88.0, 15L, "ACTIVO"
        ));

        ranking.add(new DashboardDto.RankingGrupo(
                3L, "Grupo C", "Líder Mendez", 76.0, 10L, "PENDIENTE"
        ));

        return ranking;
    }

    @Override
    public List<DashboardDto.TendenciaAsistencia> getTendenciaAsistencia(int semanas) {
        List<DashboardDto.TendenciaAsistencia> tendencia = new ArrayList<>();
        LocalDate hoy = LocalDate.now();

        for (int i = semanas; i >= 0; i--) {
            LocalDate fecha = hoy.minusWeeks(i);
            tendencia.add(new DashboardDto.TendenciaAsistencia(
                    fecha,
                    80.0 + (Math.random() * 20), // Porcentaje aleatorio entre 80-100
                    (long)(250 + (Math.random() * 50)), // Presentes
                    300L // Total registrados
            ));
        }

        return tendencia;
    }

    @Override
    public List<DashboardDto.EstudianteBajaAsistencia> getEstudiantesBajaAsistencia() {
        List<DashboardDto.EstudianteBajaAsistencia> estudiantes = new ArrayList<>();

        estudiantes.add(new DashboardDto.EstudianteBajaAsistencia(
                1L, "Sofía Ramirez", "Ingeniería de Sistemas", "Grupo A", 45.0, 3, "ENFERMEDAD"
        ));

        estudiantes.add(new DashboardDto.EstudianteBajaAsistencia(
                2L, "Mateo Vargas", "Teología", "Grupo B", 52.0, 2, "TRABAJO"
        ));

        return estudiantes;
    }

    @Override
    public List<DashboardDto.MetricasFacultad> getMetricasFacultades() {
        List<DashboardDto.MetricasFacultad> metricas = new ArrayList<>();

        metricas.add(new DashboardDto.MetricasFacultad(
                "Ingeniería de Sistemas", 180L, 8L, 87.5, 175L, 12L
        ));

        metricas.add(new DashboardDto.MetricasFacultad(
                "Teología", 120L, 6L, 82.3, 115L, 8L
        ));

        metricas.add(new DashboardDto.MetricasFacultad(
                "Medicina", 90L, 4L, 91.2, 88L, 3L
        ));

        return metricas;
    }
}
