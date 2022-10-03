package controller.users;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserService;

@WebServlet("/usuario-eliminar.do")
public class DeleteUserServlet extends HttpServlet implements Servlet {
	
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

		if(userService.delete(id)) {
			req.setAttribute("flash", "¡Usuario elimiado exitosamente!");
		} else {
			req.setAttribute("flash", "Ha ocurrido un error al eliminar usuario");
		}
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/adm-usuarios.do");
		dispatcher.forward(req, resp);
		
	}
	
}
