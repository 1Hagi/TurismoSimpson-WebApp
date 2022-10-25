package controller.excursions;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Oferta;
import model.Ordenamiento;
import model.Usuario;
import services.OfferService;

@WebServlet("/logged.do")
public class ListOffersServlet extends HttpServlet implements Servlet {
	
	private static final long serialVersionUID = -7343359082562184278L;
	private OfferService ofertaService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.ofertaService = new OfferService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getAttribute("ofertas") == null) {
			List<Oferta> ofertas = ofertaService.list();
			req.setAttribute("ofertas", ofertas);
			Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");
			Collections.sort(ofertas, new Ordenamiento(usuario.getFavorito()));
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/logged.jsp");
		dispatcher.forward(req, resp);
	}
	
}
