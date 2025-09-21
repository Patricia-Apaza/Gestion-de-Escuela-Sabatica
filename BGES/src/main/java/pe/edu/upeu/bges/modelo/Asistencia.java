package pe.edu.upeu.bges.modelo;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "asistencias")
public class Asistencia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_asistencia")
    private Long idAsistencia;

    @Column(name = "usuario_id", nullable = false)
    private Long usuarioId;

    @Column(name = "grupo_id", nullable = false)
    private Long grupoId;

    @Column(name = "fecha_asistencia", nullable = false)
    private LocalDate fechaAsistencia;

    @Column(name = "presente")
    private Boolean presente = false;

    @Enumerated(EnumType.STRING)
    @Column(name = "motivo_ausencia")
    private MotivoAusencia motivoAusencia;

    @Column(name = "observaciones", columnDefinition = "TEXT")
    private String observaciones;

    @Column(name = "registrado_por")
    private Long registradoPor;

    @Column(name = "fecha_registro")
    private LocalDateTime fechaRegistro = LocalDateTime.now();

    public enum MotivoAusencia {
        ENFERMEDAD, VIAJE, TRABAJO, PERSONAL, DESCONOCIDA
    }
}
