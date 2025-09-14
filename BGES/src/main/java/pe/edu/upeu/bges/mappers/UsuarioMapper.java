package pe.edu.upeu.bges.mappers;

import org.springframework.stereotype.Component;
import pe.edu.upeu.bges.dtos.UsuarioDto;
import pe.edu.upeu.bges.modelo.Usuario;

@Component
public class UsuarioMapper {

    public UsuarioDto toDto(Usuario usuario) {
        if (usuario == null) return null;

        UsuarioDto dto = new UsuarioDto();
        dto.setIdUsuario(usuario.getIdUsuario());
        dto.setNombreCompleto(usuario.getNombreCompleto());
        dto.setDni(usuario.getDni());
        dto.setCorreo(usuario.getCorreo());
        dto.setRol(usuario.getRol());
        dto.setEstado(usuario.getEstado());
        dto.setFacultadCarrera(usuario.getFacultadCarrera());

        return dto;
    }

    public Usuario toEntity(UsuarioDto dto) {
        if (dto == null) return null;

        Usuario usuario = new Usuario();
        usuario.setIdUsuario(dto.getIdUsuario());
        usuario.setNombreCompleto(dto.getNombreCompleto());
        usuario.setDni(dto.getDni());
        usuario.setCorreo(dto.getCorreo());
        usuario.setRol(dto.getRol());
        usuario.setEstado(dto.getEstado());
        usuario.setFacultadCarrera(dto.getFacultadCarrera());

        return usuario;
    }

    public Usuario toEntityFromCrearDto(UsuarioDto.CrearUsuarioDto dto) {
        if (dto == null) return null;

        Usuario usuario = new Usuario();
        usuario.setNombreCompleto(dto.nombreCompleto());
        usuario.setDni(dto.dni());
        usuario.setCorreo(dto.correo());
        usuario.setRol(dto.rol());
        usuario.setFacultadCarrera(dto.facultadCarrera());
        usuario.setEstado(Usuario.Estado.ACTIVO);

        return usuario;
    }
}
