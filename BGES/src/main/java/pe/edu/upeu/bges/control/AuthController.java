package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.servicio.IUsuarioService;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired
    private IUsuarioService usuarioService;

    @PostMapping("/login")
    public ResponseEntity<UsuarioDto.LoginResponseDto> login(@RequestBody UsuarioDto.LoginRequestDto loginRequest) {
        UsuarioDto.LoginResponseDto response = usuarioService.login(loginRequest);

        if (response.success()) {
            // Actualizar último acceso
            usuarioService.actualizarUltimoAcceso(response.idUsuario());
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/registrar")
    public ResponseEntity<String> registrar(@RequestBody UsuarioDto.CrearUsuarioDto crearUsuarioDto) {
        try {
            // Solo permitir auto-registro de INTEGRANTE
            if (crearUsuarioDto.rol() != null && crearUsuarioDto.rol() != Usuario.Rol.INTEGRANTE) {
                return ResponseEntity.badRequest().body("No se puede auto-registrar con ese rol");
            }

            usuarioService.crearIntegrante(crearUsuarioDto, null);
            return ResponseEntity.ok("Usuario registrado exitosamente");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error al registrar usuario: " + e.getMessage());
        }
    }

    @PostMapping("/recuperar-password")
    public ResponseEntity<String> recuperarPassword(@RequestParam String dni) {
        try {
            // Aquí implementarías la lógica de recuperación de contraseña
            // Por ahora, solo un mensaje de confirmación
            return ResponseEntity.ok("Se ha enviado un correo con instrucciones para recuperar la contraseña");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error al procesar solicitud: " + e.getMessage());
        }
    }
}
