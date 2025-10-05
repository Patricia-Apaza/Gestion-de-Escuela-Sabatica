package pe.edu.upeu.bges.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pe.edu.upeu.bges.modelo.Persona;
import java.util.List;
import java.util.Optional;

public interface PersonaRepository extends JpaRepository<Persona, Long> {

    Optional<Persona> findByCodigoEstudiante(String codigoEstudiante);
    Optional<Persona> findByDocumentoIdentidad(String documentoIdentidad);
    Optional<Persona> findByUsuarioId(Long usuarioId);

    List<Persona> findBySede(String sede);
    List<Persona> findByFacultad(String facultad);
    List<Persona> findByProgramaEstudio(String programaEstudio);

    @Query("SELECT p FROM Persona p WHERE p.sede = :sede AND p.facultad = :facultad")
    List<Persona> findBySedeAndFacultad(@Param("sede") String sede, @Param("facultad") String facultad);

    boolean existsByCodigoEstudiante(String codigoEstudiante);
    boolean existsByDocumentoIdentidad(String documentoIdentidad);
    boolean existsByCorreoPersonal(String correoPersonal);
    boolean existsByCorreoInstitucional(String correoInstitucional);
}
