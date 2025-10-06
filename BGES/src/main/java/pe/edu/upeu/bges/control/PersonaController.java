package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pe.edu.upeu.bges.dtos.PersonaDto;
import pe.edu.upeu.bges.modelo.Persona;
import pe.edu.upeu.bges.servicio.IPersonaService;

import java.util.List;

@RestController
@RequestMapping("/api/personas")
@CrossOrigin(origins = "*")
public class PersonaController {

    @Autowired
    private IPersonaService personaService;

    @GetMapping
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<List<PersonaDto.PersonaListadoDto>> listarPersonas() {
        List<PersonaDto.PersonaListadoDto> personas = personaService.listarPersonas();
        return ResponseEntity.ok(personas);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<Persona> obtenerPersona(@PathVariable Long id) {
        Persona persona = personaService.obtenerPersona(id);
        return ResponseEntity.ok(persona);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<Persona> crearPersona(@RequestBody PersonaDto.CrearPersonaDto crearDto) {
        Long creadoPor = 1L; // TODO: Obtener del token
        Persona persona = personaService.crearPersona(crearDto, creadoPor);
        return ResponseEntity.ok(persona);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<Persona> actualizarPersona(
            @PathVariable Long id,
            @RequestBody PersonaDto.CrearPersonaDto actualizarDto) {
        Long modificadoPor = 1L;
        Persona persona = personaService.actualizarPersona(id, actualizarDto, modificadoPor);
        return ResponseEntity.ok(persona);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('SUPERADMIN')")
    public ResponseEntity<String> eliminarPersona(@PathVariable Long id) {
        personaService.eliminarPersona(id);
        return ResponseEntity.ok("Persona eliminada exitosamente");
    }

    @PostMapping("/importar")
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<PersonaDto.ResultadoImportacionDto> importarExcel(
            @RequestParam("file") MultipartFile file) {

        if (file.isEmpty()) {
            throw new RuntimeException("El archivo está vacío");
        }

        if (!file.getOriginalFilename().endsWith(".xlsx")) {
            throw new RuntimeException("Solo se permiten archivos .xlsx");
        }

        Long creadoPor = 1L;
        PersonaDto.ResultadoImportacionDto resultado = personaService.importarDesdeExcel(file, creadoPor);
        return ResponseEntity.ok(resultado);
    }

    @GetMapping("/exportar")
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<byte[]> exportarExcel(@RequestParam(required = false) List<Long> ids) {
        byte[] excelBytes = personaService.exportarAExcel(ids);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", "personas_" + System.currentTimeMillis() + ".xlsx");

        return ResponseEntity.ok()
                .headers(headers)
                .body(excelBytes);
    }

    @GetMapping("/catalogo/sedes")
    public ResponseEntity<List<String>> obtenerSedes() {
        return ResponseEntity.ok(personaService.obtenerSedes());
    }

    @GetMapping("/catalogo/facultades/{sede}")
    public ResponseEntity<List<String>> obtenerFacultades(@PathVariable String sede) {
        return ResponseEntity.ok(personaService.obtenerFacultadesPorSede(sede));
    }

    @GetMapping("/catalogo/programas/{sede}/{facultad}")
    public ResponseEntity<List<String>> obtenerProgramas(
            @PathVariable String sede,
            @PathVariable String facultad) {
        return ResponseEntity.ok(personaService.obtenerProgramasPorSedeYFacultad(sede, facultad));
    }

    @GetMapping("/catalogo/completo/{sede}")
    public ResponseEntity<PersonaDto.CatalogoFiltroDto> obtenerCatalogoCompleto(@PathVariable String sede) {
        return ResponseEntity.ok(personaService.obtenerCatalogoCompleto(sede));
    }

    @GetMapping("/sede/{sede}")
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<List<PersonaDto.PersonaListadoDto>> buscarPorSede(@PathVariable String sede) {
        return ResponseEntity.ok(personaService.buscarPorSede(sede));
    }

    @GetMapping("/facultad/{facultad}")
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<List<PersonaDto.PersonaListadoDto>> buscarPorFacultad(@PathVariable String facultad) {
        return ResponseEntity.ok(personaService.buscarPorFacultad(facultad));
    }

    @GetMapping("/programa/{programa}")
    @PreAuthorize("hasAnyRole('SUPERADMIN', 'ADMIN')")
    public ResponseEntity<List<PersonaDto.PersonaListadoDto>> buscarPorPrograma(@PathVariable String programa) {
        return ResponseEntity.ok(personaService.buscarPorPrograma(programa));
    }
}
