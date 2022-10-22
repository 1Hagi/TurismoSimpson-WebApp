package controller.compras;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import persistence.commons.DAOFactory;
import services.CompraService;

@WebServlet("/compra-prom.do")
public class CompraPromPromServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = 3455721046062278592L;
	private CompraService compraService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.compraService = new CompraService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Integer promocionID = Integer.parseInt(req.getParameter("id"));
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");
		Map<String, String> errors = compraService.compraProm(usuario.getId(), promocionID);
		
		Usuario usuarioActualizado = DAOFactory.getUsuarioDAO().findByID(usuario.getId());
		req.getSession().setAttribute("user", usuarioActualizado);
		
		if (errors.isEmpty()) {
			req.setAttribute("success", "¡Gracias por comprar!");
		} else {
			req.setAttribute("errors", errors);
			req.setAttribute("flash", "No ha podido realizarse la compra");
		}

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/attractions/index.do");
		dispatcher.forward(req, resp);
	}
	
}
