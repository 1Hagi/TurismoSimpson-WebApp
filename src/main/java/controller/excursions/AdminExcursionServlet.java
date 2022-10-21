package controller.excursions;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Excursion;
import services.ExcursionService;

@WebServlet("/adm-excursiones.do")
public class AdminExcursionServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private ExcursionService excursionService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.excursionService = new ExcursionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("excursiones") == null) {
			List<Excursion> excursiones = excursionService.list();
			req.setAttribute("excursiones", excursiones);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adm-excursiones.jsp");
		dispatcher.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("excursiones") == null) {
			List<Excursion> excursiones = excursionService.list();
			req.setAttribute("excursiones", excursiones);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adm-excursiones.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
