package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.servicio.IUsuarioService;
import java.util.List;

@RestController
@RequestMapping("/api/superadmin")
@CrossOrigin(origins = "*")
public class SuperAdminController {

    @Autowired
    private IUsuarioService usuarioService;

    // Gestión de Admins
    @PostMapping("/admins/crear")
    public ResponseEntity<Usuario> crearAdmin(@RequestBody UsuarioDto.CrearAdminDto crearAdminDto) {
        // En un sistema real, obtendrías el ID del SuperAdmin autenticado
        Usuario admin = usuarioService.crearAdmin(crearAdminDto, 1L);
        return ResponseEntity.ok(admin);
    }

    @GetMapping("/admins/listar")
    public ResponseEntity<List<Usuario>> listarAdmins() {
        return ResponseEntity.ok(usuarioService.listarAdmins());
    }

    @PutMapping("/usuario/bloquear/{id}")
    public ResponseEntity<String> bloquearUsuario(@PathVariable Long id) {
        usuarioService.bloquearUsuario(id, 1L);
        return ResponseEntity.ok("Usuario bloqueado exitosamente");
    }

    @PutMapping("/usuario/desbloquear/{id}")
    public ResponseEntity<String> desbloquearUsuario(@PathVariable Long id) {
        usuarioService.desbloquearUsuario(id, 1L);
        return ResponseEntity.ok("Usuario desbloqueado exitosamente");
    }

    // Accesos temporales
    @PostMapping("/accesos-temporales/otorgar")
    public ResponseEntity<String> otorgarAccesoTemporal(@RequestBody UsuarioDto.AccesoTemporalDto accesoDto) {
        usuarioService.otorgarAccesoTemporal(accesoDto, 1L);
        return ResponseEntity.ok("Acceso temporal otorgado exitosamente");
    }

    @PutMapping("/accesos-temporales/revocar/{idUsuario}")
    public ResponseEntity<String> revocarAccesoTemporal(@PathVariable Long idUsuario) {
        usuarioService.revocarAccesoTemporal(idUsuario, 1L);
        return ResponseEntity.ok("Acceso temporal revocado exitosamente");
    }

    @GetMapping("/accesos-temporales/listar")
    public ResponseEntity<List<Usuario>> listarAccesosTemporales() {
        return ResponseEntity.ok(usuarioService.listarAccesosTemporales());
    }

    // Métricas globales
    @GetMapping("/metricas/roles")
    public ResponseEntity<List<Object[]>> getEstadisticasPorRol() {
        return ResponseEntity.ok(usuarioService.getEstadisticasPorRol());
    }

    @GetMapping("/metricas/facultades")
    public ResponseEntity<List<Object[]>> getEstadisticasPorFacultad() {
        return ResponseEntity.ok(usuarioService.getEstadisticasPorFacultad());
    }

    @PutMapping("/usuario/restablecer-password/{id}")
    public ResponseEntity<String> restablecerPassword(@PathVariable Long id, @RequestBody String nuevaPassword) {
        usuarioService.restablecerContraseña(id, nuevaPassword, 1L);
        return ResponseEntity.ok("Contraseña restablecida exitosamente");
    }
}
