package controlador;

import modelo.Usuario;
import repositorio.UsuarioRepository;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    private UsuarioRepository usuarioRepo = new UsuarioRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setUsername(username);
        nuevoUsuario.setEmail(email);
        nuevoUsuario.setPassword(password);

        if (usuarioRepo.registrar(nuevoUsuario)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?success=true");
        } else {
            request.setAttribute("error", "Error al registrar el usuario. El nombre de usuario podría ya existir.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
        }
    }
}
