package pe.edu.upeu.bges.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pe.edu.upeu.bges.modelo.CatalogoPrograma;
import java.util.List;

public interface CatalogoProgramaRepository extends JpaRepository<CatalogoPrograma, Long> {

    @Query("SELECT DISTINCT c.sede FROM CatalogoPrograma c WHERE c.activo = true")
    List<String> findAllSedesActivas();

    @Query("SELECT DISTINCT c.facultad FROM CatalogoPrograma c WHERE c.sede = :sede AND c.activo = true")
    List<String> findFacultadesBySede(@Param("sede") String sede);

    @Query("SELECT c.programaEstudio FROM CatalogoPrograma c WHERE c.sede = :sede AND c.facultad = :facultad AND c.activo = true")
    List<String> findProgramasBySedeAndFacultad(@Param("sede") String sede, @Param("facultad") String facultad);

    List<CatalogoPrograma> findBySede(String sede);
}
