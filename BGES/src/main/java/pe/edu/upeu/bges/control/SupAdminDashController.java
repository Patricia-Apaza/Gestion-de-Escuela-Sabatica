package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.DashboardDto;
import pe.edu.upeu.bges.dtos.GrupoDto;
import pe.edu.upeu.bges.servicio.IDashboardService;
import pe.edu.upeu.bges.servicio.IGrupoService;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/superadmin/dashboard")
@CrossOrigin(origins = "*")
public class SupAdminDashController {

    @Autowired
    private IDashboardService dashboardService;

    @Autowired
    private IGrupoService grupoService;

    // Endpoint para estadísticas generales del dashboard
    @GetMapping("/estadisticas")
    public ResponseEntity<DashboardDto.EstadisticasGenerales> getEstadisticasGenerales() {
        DashboardDto.EstadisticasGenerales stats = dashboardService.getEstadisticasGenerales();
        return ResponseEntity.ok(stats);
    }

    // Endpoint para ranking de grupos
    @GetMapping("/ranking-grupos")
    public ResponseEntity<List<DashboardDto.RankingGrupo>> getRankingGrupos() {
        List<DashboardDto.RankingGrupo> ranking = dashboardService.getRankingGrupos();
        return ResponseEntity.ok(ranking);
    }

    // Endpoint para tendencia de asistencia semanal
    @GetMapping("/tendencia-asistencia")
    public ResponseEntity<List<DashboardDto.TendenciaAsistencia>> getTendenciaAsistencia(
            @RequestParam(defaultValue = "8") int semanas) {
        List<DashboardDto.TendenciaAsistencia> tendencia =
                dashboardService.getTendenciaAsistencia(semanas);
        return ResponseEntity.ok(tendencia);
    }

    // Endpoint para estudiantes con baja asistencia
    @GetMapping("/estudiantes-baja-asistencia")
    public ResponseEntity<List<DashboardDto.EstudianteBajaAsistencia>> getEstudiantesBajaAsistencia() {
        List<DashboardDto.EstudianteBajaAsistencia> estudiantes =
                dashboardService.getEstudiantesBajaAsistencia();
        return ResponseEntity.ok(estudiantes);
    }

    // Endpoint para métricas por facultad
    @GetMapping("/metricas-facultades")
    public ResponseEntity<List<DashboardDto.MetricasFacultad>> getMetricasFacultades() {
        List<DashboardDto.MetricasFacultad> metricas =
                dashboardService.getMetricasFacultades();
        return ResponseEntity.ok(metricas);
    }

    // Endpoint para obtener todos los grupos con detalles
    @GetMapping("/grupos")
    public ResponseEntity<List<GrupoDto.GrupoListadoDto>> getAllGrupos() {
        List<GrupoDto.GrupoListadoDto> grupos = grupoService.getAllGrupos();
        return ResponseEntity.ok(grupos);
    }

    // Endpoint para obtener estudiantes por filtros
    @GetMapping("/estudiantes")
    public ResponseEntity<List<DashboardDto.EstudianteBajaAsistencia>> getEstudiantesFiltrados(
            @RequestParam(required = false) String facultadCarrera,
            @RequestParam(required = false) String estado,
            @RequestParam(required = false) Boolean soloConAlertas) {
        // Implementar lógica de filtrado
        return ResponseEntity.ok().build();
    }
}
