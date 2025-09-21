package pe.edu.upeu.bges.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pe.edu.upeu.bges.dtos.MenuDto;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.servicio.IMenuService;
import java.util.List;

@RestController
@RequestMapping("/api/menu")
@CrossOrigin(origins = "*")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    // Endpoint principal: obtener menús por rol del usuario autenticado
    @GetMapping("/rol/{rol}")
    public ResponseEntity<List<MenuDto.MenuItemDto>> getMenusPorRol(@PathVariable Usuario.Rol rol) {
        List<MenuDto.MenuItemDto> menus = menuService.getMenusJerarquicosPorRol(rol);
        return ResponseEntity.ok(menus);
    }

    // Obtener información completa de menús por rol
    @GetMapping("/completo/{rol}")
    public ResponseEntity<MenuDto.MenusPorRolDto> getMenusCompleto(@PathVariable Usuario.Rol rol) {
        MenuDto.MenusPorRolDto menusCompleto = menuService.getMenusPorRol(rol);
        return ResponseEntity.ok(menusCompleto);
    }

    // Obtener rutas accesibles por rol (útil para validaciones del frontend)
    @GetMapping("/rutas/{rol}")
    public ResponseEntity<List<String>> getRutasAccesibles(@PathVariable Usuario.Rol rol) {
        List<String> rutas = menuService.getRutasAccesiblesPorRol(rol);
        return ResponseEntity.ok(rutas);
    }

    // Endpoints para gestión de menús (solo SuperAdmin)
    @PostMapping("/crear")
    public ResponseEntity<String> crearMenu(@RequestBody MenuDto.CrearMenuDto crearMenuDto) {
        menuService.crearMenu(crearMenuDto);
        return ResponseEntity.ok("Menú creado exitosamente");
    }

    @PostMapping("/permisos")
    public ResponseEntity<String> asignarPermiso(@RequestBody MenuDto.AsignarPermisoMenuDto permisoDto) {
        menuService.asignarPermisoMenu(permisoDto);
        return ResponseEntity.ok("Permiso asignado exitosamente");
    }
}
