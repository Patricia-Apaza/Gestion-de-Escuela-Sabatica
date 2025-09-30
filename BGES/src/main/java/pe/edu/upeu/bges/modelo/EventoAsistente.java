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
@Table(name = "evento_asistentes")
public class EventoAsistente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_asistente")
    private Long idAsistente;

    @Column(name = "evento_id", nullable = false)
    private Long eventoId;

    @Column(name = "usuario_id") // QUITAR nullable = false
    private Long usuarioId;

    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado_confirmacion")
    private EstadoConfirmacion estadoConfirmacion = EstadoConfirmacion.PENDIENTE;

    @Column(name = "fecha_confirmacion")
    private LocalDateTime fechaConfirmacion;

    @Column(name = "notificado")
    private Boolean notificado = false;

    @Column(name = "fecha_notificacion")
    private LocalDateTime fechaNotificacion;

    public enum EstadoConfirmacion {
        PENDIENTE, CONFIRMADO, RECHAZADO, TENTATIVO
    }
}
