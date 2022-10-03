package controller.users;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import services.UserService;

@WebServlet("/adm-usuarios.do")
public class AdminUserServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private UserService userService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.userService = new UserService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("usuarios") == null) {
			List<Usuario> usuarios = userService.list();
			req.setAttribute("usuarios", usuarios);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adm-usuarios.jsp");
		dispatcher.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("usuarios") == null) {
			List<Usuario> usuarios = userService.list();
			req.setAttribute("usuarios", usuarios);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adm-usuarios.jsp");
		dispatcher.forward(req, resp);
	}
	
}
