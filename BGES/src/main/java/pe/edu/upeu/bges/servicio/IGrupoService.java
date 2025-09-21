package pe.edu.upeu.bges.servicio;

import pe.edu.upeu.bges.dtos.GrupoDto;
import pe.edu.upeu.bges.modelo.Grupo;
import java.util.List;

public interface IGrupoService {
    List<GrupoDto.GrupoListadoDto> getAllGrupos();
    GrupoDto.GrupoDetalleDto getGrupoDetalle(Long idGrupo);
    Grupo crearGrupo(GrupoDto.CrearGrupoDto crearGrupoDto, Long creadoPor);
    List<GrupoDto.GrupoListadoDto> getGruposPorFacultad(String facultadCarrera);
    void actualizarLiderGrupo(Long idGrupo, Long nuevoLiderId, Long modificadoPor);
}
