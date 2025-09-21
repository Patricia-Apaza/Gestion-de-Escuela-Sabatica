package pe.edu.upeu.bges.dtos;

import pe.edu.upeu.bges.modelo.Usuario;
import java.util.List;

public class MenuDto {

    // DTO para el menú que se envía al frontend
    public record MenuItemDto(
            Long idMenu,
            String nombre,
            String titulo,
            String icono,
            String ruta,
            Integer orden,
            Boolean activo,
            Boolean esPadre,
            Long menuPadreId,
            Boolean puedeVer,
            Boolean puedeEditar,
            Boolean puedeEliminar,
            List<MenuItemDto> submenus
    ) {}

    // DTO para crear/actualizar menús
    public record CrearMenuDto(
            String nombre,
            String tituloDisplay,
            String icono,
            String ruta,
            Integer orden,
            Boolean esPadre,
            Long menuPadreId,
            String descripcion
    ) {}

    // DTO para asignar permisos
    public record AsignarPermisoMenuDto(
            Long menuId,
            Usuario.Rol rol,
            Boolean puedeVer,
            Boolean puedeEditar,
            Boolean puedeEliminar
    ) {}

    // DTO para respuesta de menús por rol
    public record MenusPorRolDto(
            Usuario.Rol rol,
            List<MenuItemDto> menus,
            Integer totalMenus
    ) {}
}
