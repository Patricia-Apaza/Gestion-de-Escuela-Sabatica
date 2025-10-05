package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.excepciones.ModelNotFoundException;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.repositorio.UsuarioRepository;
import pe.edu.upeu.bges.servicio.IUsuarioService;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired
    private IUsuarioService usuarioService;
    @Autowired
    private UsuarioRepository usuarioRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public ResponseEntity<UsuarioDto.LoginResponseDto> login(@RequestBody UsuarioDto.LoginRequestDto loginRequest) {
        UsuarioDto.LoginResponseDto response = usuarioService.login(loginRequest);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/change-superadmin-password")
    public ResponseEntity<String> changeSuperadminPassword(@RequestBody String newPassword) {
        Usuario superadmin = usuarioRepository.findByUsuario("superadmin")
                .orElseThrow(() -> new ModelNotFoundException("SuperAdmin no encontrado"));

        superadmin.setContraseña(passwordEncoder.encode(newPassword));
        usuarioRepository.save(superadmin);

        return ResponseEntity.ok("Contraseña actualizada exitosamente. Nueva contraseña: " + newPassword);
    }
}
