package repositorio;

import modelo.Categoria;
import modelo.Producto;
import conexion.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoRepositoryImpl implements Repository<Producto> {

    private Connection getConn() {
        return ConexionBD.getInstancia().getConexion();
    }

    @Override
    public List<Producto> listar() {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT p.*, c.nombre as categoria_nombre FROM productos p " +
                "INNER JOIN categorias c ON (p.id_categoria = c.id)";
        try (Statement stmt = getConn().createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                productos.add(crearProducto(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }

    @Override
    public Producto porId(int id) {
        String sql = "SELECT p.*, c.nombre as categoria_nombre FROM productos p " +
                "INNER JOIN categorias c ON (p.id_categoria = c.id) WHERE p.id = ?";
        try (PreparedStatement stmt = getConn().prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return crearProducto(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void guardar(Producto producto) {
        String sql;
        if (producto.getId() > 0) {
            sql = "UPDATE productos SET nombre=?, precio=?, id_categoria=?, fecha_elaboracion=?, estado=? WHERE id=?";
        } else {
            sql = "INSERT INTO productos(nombre, precio, id_categoria, fecha_elaboracion, estado) VALUES(?,?,?,?,?)";
        }

        try (PreparedStatement stmt = getConn().prepareStatement(sql)) {
            stmt.setString(1, producto.getNombre());
            stmt.setDouble(2, producto.getPrecio());
            stmt.setInt(3, producto.getCategoria().getId());
            stmt.setDate(4, new java.sql.Date(producto.getFechaElaboracion().getTime()));
            stmt.setBoolean(5, producto.isEstado());

            if (producto.getId() > 0) {
                stmt.setInt(6, producto.getId());
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void eliminar(int id) {
        String sql = "DELETE FROM productos WHERE id = ?";
        try (PreparedStatement stmt = getConn().prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método auxiliar para mapear el ResultSet a Objeto
    private Producto crearProducto(ResultSet rs) throws SQLException {
        Producto p = new Producto();
        p.setId(rs.getInt("id"));
        p.setNombre(rs.getString("nombre"));
        p.setPrecio(rs.getDouble("precio"));
        p.setFechaElaboracion(rs.getDate("fecha_elaboracion"));
        p.setEstado(rs.getBoolean("estado"));

        Categoria c = new Categoria();
        c.setId(rs.getInt("id_categoria"));
        c.setNombre(rs.getString("categoria_nombre"));
        p.setCategoria(c);
        return p;
    }
}