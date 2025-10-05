package pe.edu.upeu.bges.dtos;

import pe.edu.upeu.bges.modelo.Persona;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class PersonaDto {

    // DTO para importar desde Excel
    public record ImportarPersonaDto(
            String codigoEstudiante,
            String estudiante, // Apellidos y nombres juntos
            String documentoIdentidad,
            String correoPersonal,
            String correoInstitucional,
            String usuarioLogin,
            String celular,
            String pais,
            String fotoUrl,
            String religion,
            LocalDate fechaNacimiento,
            LocalDateTime fechaMatricula,
            String modoContrato,
            String modalidadEstudio,
            String sede,
            String facultad,
            String programaEstudio,
            Integer ciclo,
            Integer grupo
    ) {
        // Método para separar apellidos y nombres
        public String[] separarNombresApellidos() {
            if (estudiante == null || estudiante.trim().isEmpty()) {
                return new String[]{"", ""};
            }

            String[] partes = estudiante.trim().split("\\s+");
            if (partes.length <= 2) {
                return new String[]{partes[0], partes.length > 1 ? partes[1] : ""};
            }

            // Asumir que los primeros 2 son apellidos y el resto nombres
            int mitad = partes.length / 2;
            String apellidos = String.join(" ", java.util.Arrays.copyOfRange(partes, 0, mitad));
            String nombres = String.join(" ", java.util.Arrays.copyOfRange(partes, mitad, partes.length));

            return new String[]{apellidos, nombres};
        }
    }

    // DTO para crear persona manual
    public record CrearPersonaDto(
            String codigoEstudiante,
            String nombres,
            String apellidos,
            String documentoIdentidad,
            String correoPersonal,
            String correoInstitucional,
            String usuarioLogin,
            String celular,
            String pais,
            String fotoUrl,
            String religion,
            LocalDate fechaNacimiento,
            LocalDateTime fechaMatricula,
            Persona.ModoContrato modoContrato,
            Persona.ModalidadEstudio modalidadEstudio,
            String sede,
            String facultad,
            String programaEstudio,
            Integer ciclo,
            Integer grupo
    ) {}

    // DTO para listado
    public record PersonaListadoDto(
            Long idPersona,
            String codigoEstudiante,
            String nombreCompleto,
            String documentoIdentidad,
            String correoPersonal,
            String correoInstitucional,
            String usuarioLogin,
            String sede,
            String facultad,
            String programaEstudio,
            Integer ciclo,
            Integer grupo,
            String rol
    ) {}

    // DTO para resultado de importación
    public record ResultadoImportacionDto(
            int totalRegistros,
            int exitosos,
            int fallidos,
            List<ErrorImportacionDto> errores
    ) {}

    public record ErrorImportacionDto(
            int fila,
            String codigoEstudiante,
            String mensaje
    ) {}

    // DTO para filtros de catálogo
    public record CatalogoFiltroDto(
            String sede,
            List<FacultadDto> facultades
    ) {}

    public record FacultadDto(
            String nombre,
            List<String> programas
    ) {}
}
