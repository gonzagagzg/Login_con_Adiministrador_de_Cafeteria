package repositorio;

import modelo.Categoria;
import conexion.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaRepository {

    private Connection getConn() {
        return ConexionBD.getInstancia().getConexion();
    }

    public List<Categoria> listar() {
        List<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT * FROM categorias";
        try (Statement stmt = getConn().createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                categorias.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categorias;
    }
}
