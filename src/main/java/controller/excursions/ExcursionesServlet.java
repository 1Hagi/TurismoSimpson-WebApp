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
import services.OfferService;

@WebServlet("/excursiones.do")
public class ExcursionesServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private OfferService ofertaService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.ofertaService = new OfferService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("excursiones") == null) {
			List<Excursion> excursiones = ofertaService.listE();
			req.setAttribute("excursiones", excursiones);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/excursiones.jsp");
		dispatcher.forward(req, resp);
	}
	
}
