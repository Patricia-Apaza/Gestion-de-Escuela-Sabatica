package pe.edu.upeu.bges.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pe.edu.upeu.bges.modelo.MenuRol;
import pe.edu.upeu.bges.modelo.Usuario;
import java.util.List;
import java.util.Optional;

public interface MenuRolRepository extends JpaRepository<MenuRol, Long> {

    List<MenuRol> findByRol(Usuario.Rol rol);

    List<MenuRol> findByMenuId(Long menuId);

    Optional<MenuRol> findByMenuIdAndRol(Long menuId, Usuario.Rol rol);

    @Query("SELECT mr FROM MenuRol mr WHERE mr.rol = :rol AND mr.puedeVer = true")
    List<MenuRol> findPermisosVisiblesPorRol(@Param("rol") Usuario.Rol rol);
}
