package pe.edu.upeu.bges.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        // Buscar token directamente en el header Authorization (SIN "Bearer ")
        final String header = request.getHeader("Authorization");

        if (header != null && !header.trim().isEmpty()) {
            try {
                // Tomar el token directamente, sin quitar "Bearer "
                String jwtToken = header.trim();

                // Validar y extraer información del token
                if (jwtTokenUtil.validateToken(jwtToken)) {
                    String username = jwtTokenUtil.getUsernameFromToken(jwtToken);
                    String role = jwtTokenUtil.getRolFromToken(jwtToken);
                    Long idUsuario = jwtTokenUtil.getIdUsuarioFromToken(jwtToken);

                    // Crear contexto de seguridad
                    UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
                            username,
                            null,
                            Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + role))
                    );

                    // Agregar información adicional al contexto
                    auth.setDetails(idUsuario);
                    SecurityContextHolder.getContext().setAuthentication(auth);
                }
            } catch (Exception e) {
                // Token inválido, continuar sin autenticación
                logger.debug("Token JWT inválido: " + e.getMessage());
            }
        }

        filterChain.doFilter(request, response);
    }
}
