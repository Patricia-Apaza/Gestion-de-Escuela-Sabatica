package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.servicio.IUsuarioService;

import java.util.List;

@RestController
@RequestMapping("/api/usuario")
@CrossOrigin(origins = "*")
public class UsuarioController {

    @Autowired
    private IUsuarioService usuarioService;

    @GetMapping("/listar")
    public ResponseEntity<List<Usuario>> listar() {
        return ResponseEntity.ok(usuarioService.findAll());
    }

    @GetMapping("/buscar/{id}")
    public ResponseEntity<Usuario> buscar(@PathVariable Long id) {
        Usuario usuario = usuarioService.findById(id);
        return ResponseEntity.ok(usuario);
    }

    @GetMapping("/buscar/dni/{dni}")
    public ResponseEntity<Usuario> buscarPorDni(@PathVariable String dni) {
        // Implementar método en el repositorio si es necesario
        return ResponseEntity.ok().build();
    }

    @PostMapping("/crear")
    public ResponseEntity<Usuario> crear(@RequestBody UsuarioDto.CrearUsuarioDto crearDto) {
        // Método corregido que ahora existe en la interfaz
        Usuario usuario = usuarioService.crearUsuario(crearDto, null);
        return ResponseEntity.ok(usuario);
    }

    @PutMapping("/actualizar")
    public ResponseEntity<Usuario> actualizar(@RequestBody UsuarioDto.ActualizarUsuarioDto actualizarDto) {
        Usuario usuario = usuarioService.actualizarUsuario(actualizarDto, null);
        return ResponseEntity.ok(usuario);
    }

    @PutMapping("/bloquear/{id}")
    public ResponseEntity<String> bloquear(@PathVariable Long id) {
        usuarioService.bloquearUsuario(id, null);
        return ResponseEntity.ok("Usuario bloqueado exitosamente");
    }

    @PutMapping("/desbloquear/{id}")
    public ResponseEntity<String> desbloquear(@PathVariable Long id) {
        usuarioService.desbloquearUsuario(id, null);
        return ResponseEntity.ok("Usuario desbloqueado exitosamente");
    }

    @PutMapping("/restablecer-password/{id}")
    public ResponseEntity<String> restablecerPassword(@PathVariable Long id, @RequestBody String nuevaPassword) {
        usuarioService.restablecerContraseña(id, nuevaPassword, null);
        return ResponseEntity.ok("Contraseña restablecida exitosamente");
    }

    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<String> eliminar(@PathVariable Long id) {
        usuarioService.delete(id);
        return ResponseEntity.ok("Usuario eliminado exitosamente");
    }

    @GetMapping("/listar/rol/{rol}")
    public ResponseEntity<List<Usuario>> listarPorRol(@PathVariable Usuario.Rol rol) {
        // Método corregido que ahora existe en la interfaz
        return ResponseEntity.ok(usuarioService.findByRol(rol));
    }

    @GetMapping("/listar/facultad/{facultad}")
    public ResponseEntity<List<Usuario>> listarPorFacultad(@PathVariable String facultad) {
        // Método corregido que ahora existe en la interfaz
        return ResponseEntity.ok(usuarioService.findByFacultadCarrera(facultad));
    }
}
