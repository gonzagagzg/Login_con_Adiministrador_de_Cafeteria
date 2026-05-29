package controlador;

import modelo.Categoria;
import modelo.Producto;
import repositorio.CategoriaRepository;
import repositorio.ProductoRepositoryImpl;
import repositorio.Repository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {

    private Repository<Producto> repo = new ProductoRepositoryImpl();
    private CategoriaRepository catRepo = new CategoriaRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        action = (action == null) ? "listar" : action;

        if (action.equals("listar")) {
            List<Producto> productos = repo.listar();
            req.setAttribute("productos", productos);
            req.getRequestDispatcher("/listar.jsp").forward(req, resp);

        } else if (action.equals("crear")) {
            req.setAttribute("producto", new Producto());
            req.setAttribute("categorias", catRepo.listar());
            req.getRequestDispatcher("/formulario.jsp").forward(req, resp);

        } else if (action.equals("editar")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Producto p = repo.porId(id);
            req.setAttribute("producto", p);
            req.setAttribute("categorias", catRepo.listar());
            req.getRequestDispatcher("/formulario.jsp").forward(req, resp);

        } else if (action.equals("eliminar")) {
            int id = Integer.parseInt(req.getParameter("id"));
            repo.eliminar(id);
            resp.sendRedirect(req.getContextPath() + "/productos");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String idStr = req.getParameter("id");
        String nombre = req.getParameter("nombre");
        double precio = Double.parseDouble(req.getParameter("precio"));
        int idCategoria = Integer.parseInt(req.getParameter("categoria"));
        String fechaStr = req.getParameter("fechaElaboracion");
        boolean estado = req.getParameter("estado") != null;

        Producto p = new Producto();
        if (idStr != null && !idStr.isEmpty()) {
            p.setId(Integer.parseInt(idStr));
        }
        p.setNombre(nombre);
        p.setPrecio(precio);
        p.setEstado(estado);

        Categoria cat = new Categoria();
        cat.setId(idCategoria);
        p.setCategoria(cat);

        try {
            Date fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaStr);
            p.setFechaElaboracion(fecha);
        } catch (ParseException e) {
            p.setFechaElaboracion(new Date());
        }

        repo.guardar(p);
        resp.sendRedirect(req.getContextPath() + "/productos");
    }
}
