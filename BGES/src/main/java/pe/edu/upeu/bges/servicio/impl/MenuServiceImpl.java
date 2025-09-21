package pe.edu.upeu.bges.servicio.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.edu.upeu.bges.dtos.MenuDto;
import pe.edu.upeu.bges.modelo.Menu;
import pe.edu.upeu.bges.modelo.MenuRol;
import pe.edu.upeu.bges.modelo.Usuario;
import pe.edu.upeu.bges.repositorio.MenuRepository;
import pe.edu.upeu.bges.repositorio.MenuRolRepository;
import pe.edu.upeu.bges.servicio.IMenuService;
import pe.edu.upeu.bges.excepciones.ModelNotFoundException;

import java.util.List;
import java.util.ArrayList;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MenuRepository menuRepository;

    @Autowired
    private MenuRolRepository menuRolRepository;

    @Override
    public MenuDto.MenusPorRolDto getMenusPorRol(Usuario.Rol rol) {
        List<Menu> menus = menuRepository.findMenusByRol(rol);
        List<MenuDto.MenuItemDto> menuItems = menus.stream()
                .map(this::convertirAMenuItemDto)
                .collect(Collectors.toList());

        return new MenuDto.MenusPorRolDto(rol, menuItems, menuItems.size());
    }

    @Override
    public List<MenuDto.MenuItemDto> getMenusJerarquicosPorRol(Usuario.Rol rol) {
        List<Menu> menusPadre = menuRepository.findMenusPadrePorRol(rol);

        return menusPadre.stream()
                .map(menu -> {
                    List<MenuDto.MenuItemDto> submenus = new ArrayList<>();
                    if (menu.getEsPadre()) {
                        List<Menu> submenusList = menuRepository.findSubmenusPorRol(rol, menu.getIdMenu());
                        submenus = submenusList.stream()
                                .map(this::convertirAMenuItemDto)
                                .collect(Collectors.toList());
                    }

                    MenuRol permisos = obtenerPermisos(menu.getIdMenu(), rol);

                    return new MenuDto.MenuItemDto(
                            menu.getIdMenu(),
                            menu.getNombre(),
                            menu.getTituloDisplay(),
                            menu.getIcono(),
                            menu.getRuta(),
                            menu.getOrden(),
                            menu.getActivo(),
                            menu.getEsPadre(),
                            menu.getMenuPadreId(),
                            permisos != null ? permisos.getPuedeVer() : false,
                            permisos != null ? permisos.getPuedeEditar() : false,
                            permisos != null ? permisos.getPuedeEliminar() : false,
                            submenus
                    );
                })
                .collect(Collectors.toList());
    }

    @Override
    public Menu crearMenu(MenuDto.CrearMenuDto crearMenuDto) {
        Menu menu = new Menu();
        menu.setNombre(crearMenuDto.nombre());
        menu.setTituloDisplay(crearMenuDto.tituloDisplay());
        menu.setIcono(crearMenuDto.icono());
        menu.setRuta(crearMenuDto.ruta());
        menu.setOrden(crearMenuDto.orden());
        menu.setEsPadre(crearMenuDto.esPadre());
        menu.setMenuPadreId(crearMenuDto.menuPadreId());
        menu.setDescripcion(crearMenuDto.descripcion());

        return menuRepository.save(menu);
    }

    @Override
    public void asignarPermisoMenu(MenuDto.AsignarPermisoMenuDto permisoDto) {
        Optional<MenuRol> existente = menuRolRepository.findByMenuIdAndRol(
                permisoDto.menuId(), permisoDto.rol());

        if (existente.isPresent()) {
            MenuRol menuRol = existente.get();
            menuRol.setPuedeVer(permisoDto.puedeVer());
            menuRol.setPuedeEditar(permisoDto.puedeEditar());
            menuRol.setPuedeEliminar(permisoDto.puedeEliminar());
            menuRolRepository.save(menuRol);
        } else {
            MenuRol nuevoPermiso = new MenuRol();
            nuevoPermiso.setMenuId(permisoDto.menuId());
            nuevoPermiso.setRol(permisoDto.rol());
            nuevoPermiso.setPuedeVer(permisoDto.puedeVer());
            nuevoPermiso.setPuedeEditar(permisoDto.puedeEditar());
            nuevoPermiso.setPuedeEliminar(permisoDto.puedeEliminar());
            menuRolRepository.save(nuevoPermiso);
        }
    }

    @Override
    public boolean usuarioTieneAcceso(Long usuarioId, String rutaMenu) {
        // Implementar lógica de verificación de acceso
        return true; // Simplificado por ahora
    }

    @Override
    public List<String> getRutasAccesiblesPorRol(Usuario.Rol rol) {
        List<Menu> menus = menuRepository.findMenusByRol(rol);
        return menus.stream()
                .map(Menu::getRuta)
                .filter(ruta -> ruta != null && !ruta.isEmpty())
                .collect(Collectors.toList());
    }

    // Métodos auxiliares
    private MenuDto.MenuItemDto convertirAMenuItemDto(Menu menu) {
        MenuRol permisos = obtenerPermisos(menu.getIdMenu(), null); // Se puede mejorar

        return new MenuDto.MenuItemDto(
                menu.getIdMenu(),
                menu.getNombre(),
                menu.getTituloDisplay(),
                menu.getIcono(),
                menu.getRuta(),
                menu.getOrden(),
                menu.getActivo(),
                menu.getEsPadre(),
                menu.getMenuPadreId(),
                permisos != null ? permisos.getPuedeVer() : false,
                permisos != null ? permisos.getPuedeEditar() : false,
                permisos != null ? permisos.getPuedeEliminar() : false,
                new ArrayList<>() // Los submenús se cargan por separado
        );
    }

    private MenuRol obtenerPermisos(Long menuId, Usuario.Rol rol) {
        if (rol == null) return null;
        return menuRolRepository.findByMenuIdAndRol(menuId, rol).orElse(null);
    }

    @Override
    public Menu actualizarMenu(Long idMenu, MenuDto.CrearMenuDto actualizarDto) {
        Menu menu = menuRepository.findById(idMenu)
                .orElseThrow(() -> new ModelNotFoundException("Menú no encontrado"));

        menu.setNombre(actualizarDto.nombre());
        menu.setTituloDisplay(actualizarDto.tituloDisplay());
        menu.setIcono(actualizarDto.icono());
        menu.setRuta(actualizarDto.ruta());
        menu.setOrden(actualizarDto.orden());
        menu.setEsPadre(actualizarDto.esPadre());
        menu.setMenuPadreId(actualizarDto.menuPadreId());
        menu.setDescripcion(actualizarDto.descripcion());

        return menuRepository.save(menu);
    }

    @Override
    public void eliminarMenu(Long idMenu) {
        menuRepository.deleteById(idMenu);
    }

    @Override
    public List<Menu> getAllMenus() {
        return menuRepository.findByActivoTrueOrderByOrdenAsc();
    }

    @Override
    public void revocarPermisoMenu(Long menuId, Usuario.Rol rol) {
        Optional<MenuRol> permiso = menuRolRepository.findByMenuIdAndRol(menuId, rol);
        if (permiso.isPresent()) {
            menuRolRepository.delete(permiso.get());
        }
    }

    @Override
    public List<MenuDto.MenuItemDto> getPermisosMenuPorRol(Usuario.Rol rol) {
        return getMenusJerarquicosPorRol(rol);
    }
}
