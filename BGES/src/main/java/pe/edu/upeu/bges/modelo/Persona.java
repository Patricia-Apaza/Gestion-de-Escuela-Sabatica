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
@Table(name = "personas")
public class Persona {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_persona")
    private Long idPersona;

    @Column(name = "usuario_id", unique = true)
    private Long usuarioId;

    // Datos académicos
    @Column(name = "codigo_estudiante", nullable = false, unique = true, length = 20)
    private String codigoEstudiante;

    @Column(name = "nombres", nullable = false, length = 100)
    private String nombres;

    @Column(name = "apellidos", nullable = false, length = 100)
    private String apellidos;

    // Documentos e identificación
    @Column(name = "documento_identidad", nullable = false, unique = true, length = 20)
    private String documentoIdentidad;

    @Column(name = "correo_personal", length = 100)
    private String correoPersonal;

    @Column(name = "correo_institucional", length = 100)
    private String correoInstitucional;

    @Column(name = "usuario_login", length = 50)
    private String usuarioLogin;

    // Contacto
    @Column(name = "celular", length = 20)
    private String celular;

    @Column(name = "pais", length = 50)
    private String pais = "Perú";

    // Información personal
    @Column(name = "foto_url", length = 500)
    private String fotoUrl;

    @Column(name = "religion", length = 100)
    private String religion;

    @Column(name = "fecha_nacimiento")
    private LocalDate fechaNacimiento;

    @Column(name = "fecha_matricula")
    private LocalDateTime fechaMatricula;

    // Información académica
    @Enumerated(EnumType.STRING)
    @Column(name = "modo_contrato")
    private ModoContrato modoContrato = ModoContrato.REGULAR;

    @Enumerated(EnumType.STRING)
    @Column(name = "modalidad_estudio")
    private ModalidadEstudio modalidadEstudio = ModalidadEstudio.PRESENCIAL;

    @Column(name = "sede", nullable = false, length = 50)
    private String sede;

    @Column(name = "facultad", nullable = false, length = 200)
    private String facultad;

    @Column(name = "programa_estudio", nullable = false, length = 200)
    private String programaEstudio;

    @Column(name = "ciclo")
    private Integer ciclo;

    @Column(name = "grupo")
    private Integer grupo;

    // Auditoría
    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    @Column(name = "fecha_modificacion")
    private LocalDateTime fechaModificacion = LocalDateTime.now();

    @Column(name = "creado_por")
    private Long creadoPor;

    @Column(name = "modificado_por")
    private Long modificadoPor;

    public enum ModoContrato {
        REGULAR, IRREGULAR
    }

    public enum ModalidadEstudio {
        PRESENCIAL, SEMIPRESENCIAL, VIRTUAL
    }

    @PreUpdate
    public void preUpdate() {
        this.fechaModificacion = LocalDateTime.now();
    }
}
