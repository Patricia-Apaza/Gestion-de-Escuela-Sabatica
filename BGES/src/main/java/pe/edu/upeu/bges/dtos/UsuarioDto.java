package pe.edu.upeu.bges.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pe.edu.upeu.bges.modelo.Usuario;
import java.time.LocalDateTime;
import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UsuarioDto {
    private Long idUsuario;
    private String nombreCompleto;
    private String dni;
    private String correo;
    private Usuario.Rol rol;
    private Usuario.Estado estado;
    private String facultadCarrera;
    private String grupoAsignado;
    private String telefono;
    private LocalDate fechaNacimiento;
    private String direccion;
    private String observaciones;
    private LocalDateTime accesoTemporalHasta;

    // DTOs para diferentes operaciones según los requerimientos
    public record LoginRequestDto(String usuario, String contraseña) {}

    public record LoginResponseDto(
            Long idUsuario,
            String nombreCompleto,
            String dni,
            String correo,
            Usuario.Rol rol,
            String facultadCarrera,
            String grupoAsignado,
            boolean success,
            String message,
            String redirectTo, // Para saber a qué panel redirigir según el rol
            String token,
            long expiresIn
    ) {}

    public record CrearUsuarioDto(
            String nombreCompleto,
            String dni,
            String correo,
            String contraseña,
            Usuario.Rol rol,
            String facultadCarrera,
            String grupoAsignado,
            String telefono,
            LocalDate fechaNacimiento,
            String direccion,
            String observaciones
    ) {}

    public record ActualizarUsuarioDto(
            Long idUsuario,
            String nombreCompleto,
            String dni,
            String correo,
            Usuario.Rol rol,
            Usuario.Estado estado,
            String facultadCarrera,
            String grupoAsignado,
            String telefono,
            LocalDate fechaNacimiento,
            String direccion,
            String observaciones
    ) {}

    // DTO para gestión de accesos temporales (SuperAdmin)
    public record AccesoTemporalDto(
            Long idUsuario,
            LocalDateTime accesoTemporalHasta,
            String motivo
    ) {}

    // DTO para crear Admins desde SuperAdmin
    public record CrearAdminDto(
            String nombreCompleto,
            String dni,
            String correo,
            String contraseña,
            String facultadCarrera,
            String telefono
    ) {}

    // DTO para respuesta de listado con información resumida
    public record UsuarioListadoDto(
            Long idUsuario,
            String nombreCompleto,
            String dni,
            String correo,
            Usuario.Rol rol,
            Usuario.Estado estado,
            String facultadCarrera,
            String grupoAsignado,
            LocalDateTime ultimoAcceso,
            boolean tieneAccesoTemporal
    ) {}
}
