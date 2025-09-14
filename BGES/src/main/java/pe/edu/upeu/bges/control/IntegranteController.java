package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.servicio.IUsuarioService;

@RestController
@RequestMapping("/api/integrante")
@CrossOrigin(origins = "*")
public class IntegranteController {

    @Autowired
    private IUsuarioService usuarioService;

    @GetMapping("/mi-perfil/{idIntegrante}")
    public ResponseEntity<Usuario> obtenerMiPerfil(@PathVariable Long idIntegrante) {
        Usuario integrante = usuarioService.findById(idIntegrante);
        return ResponseEntity.ok(integrante);
    }

    @GetMapping("/mi-lider/{grupoAsignado}")
    public ResponseEntity<Usuario> obtenerMiLider(@PathVariable String grupoAsignado) {
        Usuario lider = usuarioService.buscarLiderDeGrupo(grupoAsignado);
        return ResponseEntity.ok(lider);
    }
}
