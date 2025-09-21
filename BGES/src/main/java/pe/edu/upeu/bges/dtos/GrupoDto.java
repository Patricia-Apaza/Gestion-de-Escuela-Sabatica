package pe.edu.upeu.bges.dtos;

import pe.edu.upeu.bges.modelo.Grupo;
import java.time.LocalDateTime;
import java.util.List;

public class GrupoDto {

    public record CrearGrupoDto(
            String nombreGrupo,
            String codigoGrupo,
            String facultadCarrera,
            Long liderId,
            Integer capacidadMaxima,
            String descripcion
    ) {}

    public record GrupoListadoDto(
            Long idGrupo,
            String nombreGrupo,
            String codigoGrupo,
            String facultadCarrera,
            String nombreLider,
            String dniLider,
            Integer totalIntegrantes,
            Integer capacidadMaxima,
            Grupo.Estado estado,
            Double porcentajeAsistenciaPromedio,
            LocalDateTime fechaCreacion
    ) {}

    public record GrupoDetalleDto(
            Long idGrupo,
            String nombreGrupo,
            String codigoGrupo,
            String facultadCarrera,
            Long liderId,
            String nombreLider,
            String descripcion,
            Integer totalIntegrantes,
            Integer capacidadMaxima,
            Grupo.Estado estado,
            Double porcentajeAsistenciaPromedio,
            LocalDateTime fechaCreacion,
            List<IntegranteGrupoDto> integrantes
    ) {}

    public record IntegranteGrupoDto(
            Long idUsuario,
            String nombreCompleto,
            String dni,
            String correo,
            Double porcentajeAsistencia,
            Integer diasConsecutivosAusente,
            Boolean tieneAlertas
    ) {}
}
