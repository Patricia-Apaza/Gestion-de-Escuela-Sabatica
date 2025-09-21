package pe.edu.upeu.bges.modelo;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "grupos")
public class Grupo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_grupo")
    private Long idGrupo;

    @Column(name = "nombre_grupo", nullable = false, length = 100)
    private String nombreGrupo;

    @Column(name = "codigo_grupo", unique = true, length = 20)
    private String codigoGrupo;

    @Column(name = "facultad_carrera", nullable = false, length = 100)
    private String facultadCarrera;

    @Column(name = "lider_id")
    private Long liderId;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado")
    private Estado estado = Estado.ACTIVO;

    @Column(name = "capacidad_maxima")
    private Integer capacidadMaxima = 15;

    @Column(name = "descripcion", columnDefinition = "TEXT")
    private String descripcion;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    @Column(name = "fecha_modificacion")
    private LocalDateTime fechaModificacion = LocalDateTime.now();

    @Column(name = "creado_por")
    private Long creadoPor;

    @Column(name = "modificado_por")
    private Long modificadoPor;

    public enum Estado {
        ACTIVO, INACTIVO, PENDIENTE
    }

    @PreUpdate
    public void preUpdate() {
        this.fechaModificacion = LocalDateTime.now();
    }
}
