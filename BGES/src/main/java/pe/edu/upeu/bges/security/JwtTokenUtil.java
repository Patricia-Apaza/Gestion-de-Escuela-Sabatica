package pe.edu.upeu.bges.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import pe.edu.upeu.bges.modelo.Usuario;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Component
public class JwtTokenUtil {

    private final long JWT_TOKEN_VALIDITY = 5 * 60 * 60 * 1000; // 5 horas

    @Value("${jwt.secret:secretsecretsecretsecretsecretsecretsecretsecret}")
    private String secret;

    // Generar token con información del usuario
    public String generateToken(Usuario usuario) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("idUsuario", usuario.getIdUsuario());
        claims.put("nombreCompleto", usuario.getNombreCompleto());
        claims.put("dni", usuario.getDni());
        claims.put("rol", usuario.getRol().name());
        claims.put("facultadCarrera", usuario.getFacultadCarrera());
        claims.put("grupoAsignado", usuario.getGrupoAsignado());

        return doGenerateToken(claims, usuario.getCorreo());
    }

    private String doGenerateToken(Map<String, Object> claims, String subject) {
        SecretKey key = Keys.hmacShaKeyFor(this.secret.getBytes());
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + JWT_TOKEN_VALIDITY))
                .signWith(key)
                .compact();
    }

    // Métodos para obtener información del token
    public Claims getAllClaimsFromToken(String token) {
        SecretKey key = Keys.hmacShaKeyFor(this.secret.getBytes());
        return Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    public <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = getAllClaimsFromToken(token);
        return claimsResolver.apply(claims);
    }

    public String getUsernameFromToken(String token) {
        return getClaimFromToken(token, Claims::getSubject);
    }

    public Date getExpirationDateFromToken(String token) {
        return getClaimFromToken(token, Claims::getExpiration);
    }

    public Long getIdUsuarioFromToken(String token) {
        Claims claims = getAllClaimsFromToken(token);
        return Long.valueOf(claims.get("idUsuario").toString());
    }

    public String getRolFromToken(String token) {
        Claims claims = getAllClaimsFromToken(token);
        return claims.get("rol").toString();
    }

    public String getFacultadCarreraFromToken(String token) {
        Claims claims = getAllClaimsFromToken(token);
        return (String) claims.get("facultadCarrera");
    }

    public boolean isTokenExpired(String token) {
        final Date expiration = getExpirationDateFromToken(token);
        return expiration.before(new Date());
    }

    public boolean validateToken(String token) {
        try {
            return !isTokenExpired(token);
        } catch (Exception e) {
            return false;
        }
    }
}
