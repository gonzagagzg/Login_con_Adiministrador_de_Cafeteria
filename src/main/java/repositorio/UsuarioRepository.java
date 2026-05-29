package repositorio;

import modelo.Usuario;
import conexion.ConexionBD;
import java.sql.*;

public class UsuarioRepository {

    private Connection getConn() {
        return ConexionBD.getInstancia().getConexion();
    }

    public Usuario autenticar(String username, String password) {
        String sql = "SELECT id, username, email FROM usuarios WHERE username = ? AND password = ?";

        try (PreparedStatement stmt = getConn().prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setId(rs.getLong("id"));
                    usuario.setUsername(rs.getString("username"));
                    usuario.setEmail(rs.getString("email"));
                    return usuario;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Retorna null si las credenciales son incorrectas
    }

    public boolean registrar(Usuario usuario) {
        String sql = "INSERT INTO usuarios (username, password, email) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = getConn().prepareStatement(sql)) {
            stmt.setString(1, usuario.getUsername());
            stmt.setString(2, usuario.getPassword());
            stmt.setString(3, usuario.getEmail());
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
