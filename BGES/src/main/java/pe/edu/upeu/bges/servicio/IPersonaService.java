package pe.edu.upeu.bges.servicio;

import org.springframework.web.multipart.MultipartFile;
import pe.edu.upeu.bges.dtos.PersonaDto;
import pe.edu.upeu.bges.modelo.Persona;
import java.util.List;

public interface IPersonaService {

    // CRUD básico
    Persona crearPersona(PersonaDto.CrearPersonaDto crearDto, Long creadoPor);
    Persona actualizarPersona(Long idPersona, PersonaDto.CrearPersonaDto actualizarDto, Long modificadoPor);
    void eliminarPersona(Long idPersona);
    Persona obtenerPersona(Long idPersona);
    List<PersonaDto.PersonaListadoDto> listarPersonas();

    // Importación/Exportación Excel
    PersonaDto.ResultadoImportacionDto importarDesdeExcel(MultipartFile file, Long creadoPor);
    byte[] exportarAExcel(List<Long> idsPersonas);

    // Filtros y búsquedas
    List<PersonaDto.PersonaListadoDto> buscarPorSede(String sede);
    List<PersonaDto.PersonaListadoDto> buscarPorFacultad(String facultad);
    List<PersonaDto.PersonaListadoDto> buscarPorPrograma(String programa);

    // Catálogo
    List<String> obtenerSedes();
    List<String> obtenerFacultadesPorSede(String sede);
    List<String> obtenerProgramasPorSedeYFacultad(String sede, String facultad);
    PersonaDto.CatalogoFiltroDto obtenerCatalogoCompleto(String sede);
}
