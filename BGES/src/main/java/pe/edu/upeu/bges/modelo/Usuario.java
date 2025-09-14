package pe.edu.upeu.bges.modelo;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import java.time.LocalDate;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "usuario")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")
    private Long idUsuario;

    @Column(name = "nombre_completo", nullable = false, length = 100)
    private String nombreCompleto;

    @Column(name = "dni", nullable = false, unique = true, length = 20)
    private String dni;

    @Column(name = "correo", unique = true, length = 100)
    private String correo;

    @Column(name = "contraseña", nullable = false)
    private String contraseña;

    @Enumerated(EnumType.STRING)
    @Column(name = "rol", nullable = false)
    private Rol rol;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado")
    private Estado estado = Estado.ACTIVO;

    @Column(name = "facultad_carrera", length = 100)
    private String facultadCarrera;

    @Column(name = "grupo_asignado", length = 100)
    private String grupoAsignado;

    @Column(name = "telefono", length = 20)
    private String telefono;

    @Column(name = "fecha_nacimiento")
    private LocalDate fechaNacimiento;

    @Column(name = "direccion", columnDefinition = "TEXT")
    private String direccion;

    @Column(name = "observaciones", columnDefinition = "TEXT")
    private String observaciones;

    @Column(name = "acceso_temporal_hasta")
    private LocalDateTime accesoTemporalHasta;

    @Column(name = "ultimo_acceso")
    private LocalDateTime ultimoAcceso;

    @Column(name = "intentos_fallidos")
    private Integer intentosFallidos = 0;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    @Column(name = "fecha_modificacion")
    private LocalDateTime fechaModificacion = LocalDateTime.now();

    @Column(name = "creado_por")
    private Long creadoPor;

    @Column(name = "modificado_por")
    private Long modificadoPor;

    public enum Rol {
        SUPERADMIN, ADMIN, LIDER, INTEGRANTE
    }

    public enum Estado {
        ACTIVO, BLOQUEADO, INACTIVO
    }

    @PreUpdate
    public void preUpdate() {
        this.fechaModificacion = LocalDateTime.now();
    }

    // Método para validar si tiene acceso temporal vigente
    public boolean tieneAccesoTemporalVigente() {
        return accesoTemporalHasta != null && accesoTemporalHasta.isAfter(LocalDateTime.now());
    }

    // Método para verificar si puede acceder según su rol y estado
    public boolean puedeAcceder() {
        return estado == Estado.ACTIVO || tieneAccesoTemporalVigente();
    }
}
