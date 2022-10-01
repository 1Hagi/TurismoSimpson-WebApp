package users;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import services.UserService;

@WebServlet("/register")
public class RegisterUser extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = 3455721046062278592L;
	private UserService userService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.userService = new UserService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/usuarios/crear.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nombre = req.getParameter("username");
		String contraseña = req.getParameter("password");
		String admin = (req.getParameter("bool_admin") == null)? "0": "1";
		int tipoFavorito = Integer.parseInt(req.getParameter("tipo_oferta"));
		Integer tiempoDisponible = Integer.parseInt(req.getParameter("tiempo"));		
		double dineroDisponible = Double.parseDouble(req.getParameter("dinero"));
		
		Usuario usuario = userService.create(0, nombre, contraseña, admin, tipoFavorito, tiempoDisponible, dineroDisponible);

		
		if (usuario.isValid()) {
			
			req.setAttribute("reg_exito", "¡Usuario creado exitosamente!");
			
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/login.jsp");
			dispatcher.forward(req, resp);
			
		} else {
			
			req.setAttribute("flash", "Ah ocurrido un error");

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/register.jsp");
			dispatcher.forward(req, resp);

		}

	}
	
}
