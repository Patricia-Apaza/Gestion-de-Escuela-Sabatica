package pe.edu.upeu.bges.modelo;

import jakarta.persistence.*;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import pe.edu.upeu.bges.modelo.Usuario;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "menu_roles")
public class MenuRol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_menu_rol")
    private Long idMenuRol;

    @Column(name = "menu_id", nullable = false)
    private Long menuId;

    @Enumerated(EnumType.STRING)
    @Column(name = "rol", nullable = false)
    private Usuario.Rol rol;

    @Column(name = "puede_ver")
    private Boolean puedeVer = true;

    @Column(name = "puede_editar")
    private Boolean puedeEditar = false;

    @Column(name = "puede_eliminar")
    private Boolean puedeEliminar = false;

    @Column(name = "fecha_asignacion")
    private LocalDateTime fechaAsignacion = LocalDateTime.now();
}
