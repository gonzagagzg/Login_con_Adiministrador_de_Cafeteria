package controlador;

import modelo.Usuario;
import repositorio.UsuarioRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UsuarioRepository usuarioRepo = new UsuarioRepository();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userParam = request.getParameter("username");
        String passParam = request.getParameter("password");

        // Intentar autenticar consultando la base de datos
        Usuario usuarioLogueado = usuarioRepo.autenticar(userParam, passParam);

        if (usuarioLogueado != null) {
            // Credenciales válidas: Creamos la sesión HTTP
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuarioLogueado);

            // Redirigir al listado de productos de la cafetería
            response.sendRedirect(request.getContextPath() + "/productos");
        } else {
            // Credenciales inválidas: Regresar al login mostrando un mensaje de error
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}