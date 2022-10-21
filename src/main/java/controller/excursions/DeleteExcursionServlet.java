package controller.excursions;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ExcursionService;

@WebServlet("/excursion-eliminar.do")
public class DeleteExcursionServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private ExcursionService excursionService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.excursionService = new ExcursionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer id = Integer.parseInt(req.getParameter("id"));

		if(excursionService.delete(id)) {
			req.setAttribute("flash", "¡Excursion elimiada exitosamente!");
		} else {
			req.setAttribute("flash", "Ha ocurrido un error al eliminar excursion");
		}
		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/adm-excursiones.do");
		dispatcher.forward(req, resp);
		
	}
	
}
