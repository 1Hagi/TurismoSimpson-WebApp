package controller.session;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import services.LoginService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 5433299521146771162L;
	private LoginService loginService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		loginService = new LoginService();
	}
		
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		Usuario usuario = loginService.login(username, password);
		
		if(!usuario.isNull()) {
			req.getSession().setAttribute("usuario", usuario);
			resp.sendRedirect("logged.do");
		} else {
			req.setAttribute("flash", "Nombre de usuario o contraseña incorrectos");
			
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/login.jsp");
			dispatcher.forward(req, resp);
		}

	}
	
}
