package pe.edu.upeu.bges.dtos;

import pe.edu.upeu.bges.modelo.Usuario;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class UsuarioDto {

    // Login Request
    public record LoginRequestDto(
            String usuario,
            String contraseña
    ) {}

    // Login Response
    public record LoginResponseDto(
            Long idUsuario,
            String usuario,
            String dni,
            String correo,
            Usuario.Rol rol,
            String facultad,
            String programaEstudio,
            String grupo,
            boolean exitoso,
            String mensaje,
            String redirectTo,
            String token,
            long expiresIn
    ) {}

    // Crear Usuario DTO
    public record CrearUsuarioDto(
            String usuario,
            String correo,
            String contraseña,
            Usuario.Rol rol
    ) {}

    // Actualizar Usuario
    public record ActualizarUsuarioDto(
            Long idUsuario,
            String nombreCompleto,
            String dni,
            String correo,
            Usuario.Rol rol,
            String facultadCarrera,
            String grupoAsignado,
            String telefono,
            LocalDate fechaNacimiento,
            String direccion,
            String observaciones
    ) {}

    // Crear Admin
    public record CrearAdminDto(
            String nombreCompleto,
            String dni,
            String correo,
            String contraseña,
            String facultadCarrera,
            String telefono
    ) {}

    // Acceso Temporal
    public record AccesoTemporalDto(
            Long usuarioId,
            LocalDateTime fechaExpiracion
    ) {}
}
