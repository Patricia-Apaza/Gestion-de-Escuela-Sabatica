package pe.edu.upeu.bges.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pe.edu.upeu.bges.modelo.Menu;
import pe.edu.upeu.bges.modelo.Usuario;
import java.util.List;

public interface MenuRepository extends JpaRepository<Menu, Long> {

    // Obtener menús por rol con permisos
    @Query("""
        SELECT m FROM Menu m 
        JOIN m.permisos mr 
        WHERE mr.rol = :rol 
        AND mr.puedeVer = true 
        AND m.activo = true 
        ORDER BY m.orden ASC
        """)
    List<Menu> findMenusByRol(@Param("rol") Usuario.Rol rol);

    // Obtener menús padre (sin menú padre) por rol
    @Query("""
        SELECT m FROM Menu m 
        JOIN m.permisos mr 
        WHERE mr.rol = :rol 
        AND mr.puedeVer = true 
        AND m.activo = true 
        AND m.menuPadreId IS NULL 
        ORDER BY m.orden ASC
        """)
    List<Menu> findMenusPadrePorRol(@Param("rol") Usuario.Rol rol);

    // Obtener submenús de un menú padre por rol
    @Query("""
        SELECT m FROM Menu m 
        JOIN m.permisos mr 
        WHERE mr.rol = :rol 
        AND mr.puedeVer = true 
        AND m.activo = true 
        AND m.menuPadreId = :menuPadreId 
        ORDER BY m.orden ASC
        """)
    List<Menu> findSubmenusPorRol(@Param("rol") Usuario.Rol rol, @Param("menuPadreId") Long menuPadreId);

    // Buscar menús por nombre
    List<Menu> findByNombreContainingIgnoreCase(String nombre);

    // Obtener menús activos ordenados
    List<Menu> findByActivoTrueOrderByOrdenAsc();
}
