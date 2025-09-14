package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.servicio.IUsuarioService;
import java.util.List;

@RestController
@RequestMapping("/api/lider")
@CrossOrigin(origins = "*")
public class LiderController {

    @Autowired
    private IUsuarioService usuarioService;

    @GetMapping("/mi-grupo/{grupoAsignado}")
    public ResponseEntity<List<Usuario>> listarIntegrantesDeGrupo(@PathVariable String grupoAsignado) {
        return ResponseEntity.ok(usuarioService.listarIntegrantesDeGrupo(grupoAsignado));
    }

    @GetMapping("/mi-perfil/{idLider}")
    public ResponseEntity<Usuario> obtenerMiPerfil(@PathVariable Long idLider) {
        Usuario lider = usuarioService.findById(idLider);
        return ResponseEntity.ok(lider);
    }

    @GetMapping("/buscar-grupo/{grupoAsignado}")
    public ResponseEntity<Usuario> buscarLiderDeGrupo(@PathVariable String grupoAsignado) {
        Usuario lider = usuarioService.buscarLiderDeGrupo(grupoAsignado);
        return ResponseEntity.ok(lider);
    }
}