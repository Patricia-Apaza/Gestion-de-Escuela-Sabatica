package pe.edu.upeu.bges.servicio;

import pe.edu.upeu.bges.dtos.MenuDto;
import pe.edu.upeu.bges.modelo.Menu;
import pe.edu.upeu.bges.modelo.Usuario;
import java.util.List;

public interface IMenuService {

    // Obtener menús por rol del usuario
    MenuDto.MenusPorRolDto getMenusPorRol(Usuario.Rol rol);

    // Obtener menús jerárquicos (con submenús)
    List<MenuDto.MenuItemDto> getMenusJerarquicosPorRol(Usuario.Rol rol);

    // Gestión de menús (para SuperAdmin)
    Menu crearMenu(MenuDto.CrearMenuDto crearMenuDto);
    Menu actualizarMenu(Long idMenu, MenuDto.CrearMenuDto actualizarDto);
    void eliminarMenu(Long idMenu);
    List<Menu> getAllMenus();

    // Gestión de permisos
    void asignarPermisoMenu(MenuDto.AsignarPermisoMenuDto permisoDto);
    void revocarPermisoMenu(Long menuId, Usuario.Rol rol);
    List<MenuDto.MenuItemDto> getPermisosMenuPorRol(Usuario.Rol rol);

    // Utilidades
    boolean usuarioTieneAcceso(Long usuarioId, String rutaMenu);
    List<String> getRutasAccesiblesPorRol(Usuario.Rol rol);
}
