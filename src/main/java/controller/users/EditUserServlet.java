package controller.users;

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

@WebServlet("/usuario-editar.do")
public class EditUserServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private UserService userService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.userService = new UserService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer id = Integer.parseInt(req.getParameter("id"));
		Usuario usuario = userService.find(id);
		req.setAttribute("edituser", usuario);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/usuario-editar.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		String nombre = req.getParameter("username");
		String contraseña = req.getParameter("password");
		String admin = (req.getParameter("bool_admin") == null)? "0": "1";
		int tipoFavorito = Integer.parseInt(req.getParameter("tipo_oferta"));
		Integer tiempoDisponible = Integer.parseInt(req.getParameter("tiempo"));		
		double dineroDisponible = Double.parseDouble(req.getParameter("dinero"));
		
		Usuario usuario = userService.update(id, nombre, contraseña, admin, tipoFavorito, tiempoDisponible, dineroDisponible);

		
		if (usuario.isValid()) {
			
			req.setAttribute("flash", "¡Usuario editado exitosamente!");
			
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/adm-usuarios.do");
			dispatcher.forward(req, resp);
			
		} else {
			
			req.setAttribute("flash", "Ah ocurrido un error al editar usuario");

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/adm-usuarios.do");
			dispatcher.forward(req, resp);

		}
	}
	
}
