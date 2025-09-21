package pe.edu.upeu.bges.servicio.impl;

import org.springframework.stereotype.Service;
import pe.edu.upeu.bges.dtos.GrupoDto;
import pe.edu.upeu.bges.modelo.Grupo;
import pe.edu.upeu.bges.servicio.IGrupoService;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class GrupoServiceImpl implements IGrupoService {

    @Override
    public List<GrupoDto.GrupoListadoDto> getAllGrupos() {
        List<GrupoDto.GrupoListadoDto> grupos = new ArrayList<>();

        grupos.add(new GrupoDto.GrupoListadoDto(
                1L, "Grupo A", "GRP-A-001", "Ingeniería de Sistemas",
                "Dra. López", "12345678", 12, 15,
                Grupo.Estado.ACTIVO, 95.0, LocalDateTime.now()
        ));

        grupos.add(new GrupoDto.GrupoListadoDto(
                2L, "Grupo B", "GRP-B-002", "Teología",
                "Dra. García", "87654321", 14, 15,
                Grupo.Estado.ACTIVO, 88.0, LocalDateTime.now()
        ));

        grupos.add(new GrupoDto.GrupoListadoDto(
                3L, "Grupo C", "GRP-C-003", "Medicina",
                "Dr. Rodriguez", "11223344", 8, 15,
                Grupo.Estado.PENDIENTE, 76.0, LocalDateTime.now()
        ));

        return grupos;
    }

    @Override
    public GrupoDto.GrupoDetalleDto getGrupoDetalle(Long idGrupo) {
        // Implementación simplificada
        List<GrupoDto.IntegranteGrupoDto> integrantes = new ArrayList<>();

        return new GrupoDto.GrupoDetalleDto(
                idGrupo, "Grupo A", "GRP-A-001", "Ingeniería de Sistemas",
                1L, "Dra. López", "Grupo de estudio bíblico avanzado",
                12, 15, Grupo.Estado.ACTIVO, 95.0,
                LocalDateTime.now(), integrantes
        );
    }

    @Override
    public Grupo crearGrupo(GrupoDto.CrearGrupoDto crearGrupoDto, Long creadoPor) {
        // Implementación básica - crear el objeto Grupo
        Grupo grupo = new Grupo();
        grupo.setNombreGrupo(crearGrupoDto.nombreGrupo());
        grupo.setCodigoGrupo(crearGrupoDto.codigoGrupo());
        grupo.setFacultadCarrera(crearGrupoDto.facultadCarrera());
        grupo.setLiderId(crearGrupoDto.liderId());
        grupo.setCapacidadMaxima(crearGrupoDto.capacidadMaxima());
        grupo.setDescripcion(crearGrupoDto.descripcion());
        grupo.setCreadoPor(creadoPor);

        return grupo; // En implementación real, guardar en BD
    }

    @Override
    public List<GrupoDto.GrupoListadoDto> getGruposPorFacultad(String facultadCarrera) {
        // Filtrar grupos por facultad
        return getAllGrupos().stream()
                .filter(grupo -> grupo.facultadCarrera().equals(facultadCarrera))
                .toList();
    }

    @Override
    public void actualizarLiderGrupo(Long idGrupo, Long nuevoLiderId, Long modificadoPor) {
        // Implementación básica
        System.out.println("Actualizando líder del grupo " + idGrupo + " con líder " + nuevoLiderId);
    }
}
