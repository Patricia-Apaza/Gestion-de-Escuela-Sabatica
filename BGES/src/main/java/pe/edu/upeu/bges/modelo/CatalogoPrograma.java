package pe.edu.upeu.bges.modelo;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "catalogo_programas")
public class CatalogoPrograma {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_programa")
    private Long idPrograma;

    @Column(name = "sede", nullable = false, length = 50)
    private String sede;

    @Column(name = "facultad", nullable = false, length = 200)
    private String facultad;

    @Column(name = "programa_estudio", nullable = false, length = 200)
    private String programaEstudio;

    @Column(name = "activo")
    private Boolean activo = true;
}
