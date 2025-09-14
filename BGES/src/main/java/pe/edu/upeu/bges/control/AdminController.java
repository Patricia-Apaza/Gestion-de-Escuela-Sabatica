package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.servicio.IUsuarioService;
import java.util.List;

@RestController
@RequestMapping("/api/admin")
@CrossOrigin(origins = "*")
public class AdminController {

    @Autowired
    private IUsuarioService usuarioService;

    // Gestión de Líderes dentro de su facultad
    @PostMapping("/lideres/crear")
    public ResponseEntity<Usuario> crearLider(@RequestBody UsuarioDto.CrearUsuarioDto crearDto) {
        // En producción, obtener el ID del Admin autenticado
        Usuario lider = usuarioService.crearLider(crearDto, 2L);
        return ResponseEntity.ok(lider);
    }

    @GetMapping("/lideres/listar/{facultadCarrera}")
    public ResponseEntity<List<Usuario>> listarLideres(@PathVariable String facultadCarrera) {
        return ResponseEntity.ok(usuarioService.listarLideresPorFacultad(facultadCarrera));
    }

    @PutMapping("/lideres/asignar-grupo/{idLider}")
    public ResponseEntity<String> asignarLiderAGrupo(@PathVariable Long idLider, @RequestParam String grupoAsignado) {
        usuarioService.asignarLiderAGrupo(idLider, grupoAsignado, 2L);
        return ResponseEntity.ok("Líder asignado al grupo exitosamente");
    }

    @PutMapping("/lideres/remover-grupo/{idLider}")
    public ResponseEntity<String> removerLiderDeGrupo(@PathVariable Long idLider) {
        usuarioService.removerLiderDeGrupo(idLider, 2L);
        return ResponseEntity.ok("Líder removido del grupo exitosamente");
    }

    // Gestión de Estudiantes/Integrantes
    @PostMapping("/estudiantes/crear")
    public ResponseEntity<Usuario> crearEstudiante(@RequestBody UsuarioDto.CrearUsuarioDto crearDto) {
        Usuario estudiante = usuarioService.crearIntegrante(crearDto, 2L);
        return ResponseEntity.ok(estudiante);
    }

    @GetMapping("/estudiantes/listar/{facultadCarrera}")
    public ResponseEntity<List<Usuario>> listarEstudiantes(@PathVariable String facultadCarrera) {
        return ResponseEntity.ok(usuarioService.listarIntegrantesPorFacultad(facultadCarrera));
    }

    @GetMapping("/usuario/facultad/{facultadCarrera}")
    public ResponseEntity<List<Usuario>> listarUsuarioPorFacultad(@PathVariable String facultadCarrera) {
        return ResponseEntity.ok(usuarioService.listarPorFacultadCarrera(facultadCarrera));
    }

    @PutMapping("/usuario/actualizar")
    public ResponseEntity<Usuario> actualizarUsuario(@RequestBody UsuarioDto.ActualizarUsuarioDto actualizarDto) {
        Usuario usuario = usuarioService.actualizarUsuario(actualizarDto, 2L);
        return ResponseEntity.ok(usuario);
    }

    @PutMapping("/usuario/restablecer-password/{id}")
    public ResponseEntity<String> restablecerPassword(@PathVariable Long id, @RequestBody String nuevaPassword) {
        usuarioService.restablecerContraseña(id, nuevaPassword, 2L);
        return ResponseEntity.ok("Contraseña restablecida exitosamente");
    }

    @DeleteMapping("/usuario/eliminar/{id}")
    public ResponseEntity<String> eliminarUsuario(@PathVariable Long id) {
        usuarioService.delete(id);
        return ResponseEntity.ok("Usuario eliminado exitosamente");
    }
}
