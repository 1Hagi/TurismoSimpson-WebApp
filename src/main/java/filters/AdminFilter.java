package filters;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import model.Usuario;

@WebFilter(urlPatterns = {"/adm-excursiones.do" , "/adm-usuarios.do", "/adm-promociones.do"})
public class AdminFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		Usuario usuario = (Usuario) ((HttpServletRequest) request).getSession().getAttribute("usuario");
		if (usuario == null  || usuario.getAdmin()) {
			chain.doFilter(request, response);
		} else {
			request.setAttribute("flash", "Usted no posee permisos de Administrador para la solicitud enviada");

			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
