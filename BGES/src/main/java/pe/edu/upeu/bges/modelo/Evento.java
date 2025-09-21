package pe.edu.upeu.bges.modelo;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import java.math.BigDecimal;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "eventos")
public class Evento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_evento")
    private Long idEvento;

    @Column(name = "titulo", nullable = false, length = 200)
    private String titulo;

    @Column(name = "descripcion", columnDefinition = "TEXT")
    private String descripcion;

    @Column(name = "fecha_inicio", nullable = false)
    private LocalDateTime fechaInicio;

    @Column(name = "fecha_fin", nullable = false)
    private LocalDateTime fechaFin;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_evento", nullable = false)
    private TipoEvento tipoEvento;

    @Column(name = "ubicacion", length = 200)
    private String ubicacion;

    @Column(name = "capacidad_maxima")
    private Integer capacidadMaxima;

    @Column(name = "costo", precision = 10, scale = 2)
    private BigDecimal costo = BigDecimal.ZERO;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado")
    private EstadoEvento estado = EstadoEvento.PLANIFICADO;

    @Column(name = "facultad_carrera", length = 100)
    private String facultadCarrera;

    @Column(name = "imagen_url", length = 500)
    private String imagenUrl;

    @Column(name = "requisitos", columnDefinition = "TEXT")
    private String requisitos;

    @Column(name = "contacto_responsable", length = 100)
    private String contactoResponsable;

    @Column(name = "fecha_limite_inscripcion")
    private LocalDateTime fechaLimiteInscripcion;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    @Column(name = "creado_por")
    private Long creadoPor;

    public enum TipoEvento {
        RETIRO, CONGRESO, CAMPAÑA, CAPACITACION, SOCIAL, OTRO
    }

    public enum EstadoEvento {
        PLANIFICADO, EN_CURSO, FINALIZADO, CANCELADO
    }
}
