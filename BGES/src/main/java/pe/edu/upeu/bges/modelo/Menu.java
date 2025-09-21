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
@Table(name = "menus")
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_menu")
    private Long idMenu;

    @Column(name = "nombre", nullable = false, length = 100)
    private String nombre;

    @Column(name = "titulo_display", nullable = false, length = 100)
    private String tituloDisplay;

    @Column(name = "icono", length = 50)
    private String icono;

    @Column(name = "ruta", length = 200)
    private String ruta;

    @Column(name = "orden", nullable = false)
    private Integer orden = 0;

    @Column(name = "activo")
    private Boolean activo = true;

    @Column(name = "es_padre")
    private Boolean esPadre = false;

    @Column(name = "menu_padre_id")
    private Long menuPadreId;

    @Column(name = "descripcion", columnDefinition = "TEXT")
    private String descripcion;

    @Column(name = "fecha_creacion")
    private LocalDateTime fechaCreacion = LocalDateTime.now();

    @Column(name = "fecha_modificacion")
    private LocalDateTime fechaModificacion = LocalDateTime.now();

    @OneToMany(mappedBy = "menuId", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<MenuRol> permisos;

    @PreUpdate
    public void preUpdate() {
        this.fechaModificacion = LocalDateTime.now();
    }
}
