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
import model.Promocion;
import services.ExcursionService;
import services.PromocionService;

@WebServlet("/adm-promociones.do")
public class AdminPromocionServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private PromocionService promocionService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.promocionService = new PromocionService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("promociones") == null) {
			List<Promocion> promociones = promocionService.list();
			req.setAttribute("promociones", promociones);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adm-promociones.jsp");
		dispatcher.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("excursiones") == null) {
			List<Promocion> promociones = promocionService.list();
			req.setAttribute("promociones", excursiones);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adm-promociones.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
