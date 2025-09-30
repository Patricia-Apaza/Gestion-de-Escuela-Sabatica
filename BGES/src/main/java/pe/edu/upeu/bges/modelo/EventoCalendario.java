package pe.edu.upeu.bges.modelo;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "eventos_calendario")
public class EventoCalendario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_evento_local")
    private Long idEventoLocal;

    @Column(name = "google_event_id", length = 500, unique = true)
    private String googleEventId;

    @Column(name = "titulo", nullable = false, length = 200)
    private String titulo;

    @Column(name = "descripcion", columnDefinition = "TEXT")
    private String descripcion;

    @Column(name = "fecha_inicio", nullable = false)
    private LocalDateTime fechaInicio;

    @Column(name = "fecha_fin", nullable = false)
    private LocalDateTime fechaFin;

    @Column(name = "ubicacion", length = 200)
    private String ubicacion;

    @Column(name = "color", length = 20)
    private String color = "#1976d2";

    @Enumerated(EnumType.STRING)
    @Column(name = "estado")
    private EstadoEvento estado = EstadoEvento.PLANIFICADO;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_evento", nullable = false)
    private TipoEvento tipoEvento;

    @Column(name = "facultad_carrera", length = 100)
    private String facultadCarrera;

    @Enumerated(EnumType.STRING)
    @Column(name = "visible_para")
    private VisibilidadEvento visiblePara = VisibilidadEvento.TODOS;

    @Column(name = "sincronizado_google")
    private Boolean sincronizadoGoogle = false;

    @Column(name = "fecha_sincronizacion")
    private LocalDateTime fechaSincronizacion;

    @Column(name = "recordatorio")
    private Boolean recordatorio = true;

    @Column(name = "minutos_antes_recordatorio")
    private Integer minutosAntesRecordatorio = 30;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    @Column(name = "creado_por", nullable = false)
    private Long creadoPor;

    @OneToMany(mappedBy = "eventoId", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<EventoAsistente> asistentes;

    public enum EstadoEvento {
        PLANIFICADO, EN_CURSO, FINALIZADO, CANCELADO
    }

    public enum TipoEvento {
        RETIRO, CONGRESO, REUNION, CAPACITACION, CULTO, OTRO
    }

    public enum VisibilidadEvento {
        TODOS, FACULTAD, GRUPO, ADMIN
    }
}
