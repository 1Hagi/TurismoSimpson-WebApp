package services;

import java.util.ArrayList;
import java.util.List;

import model.Excursion;
import model.Oferta;
import model.Promocion;
import persistence.ExcursionDAO;
import persistence.PromocionDAO;
import persistence.commons.DAOFactory;

public class OfferService {
	
	public List<Oferta> list() {

		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
		List<Excursion> excursions = excursionDAO.findAll();		

		PromocionDAO promocionDAO = DAOFactory.getPromocionDAO();
		List<Promocion> promos = promocionDAO.findAll();
		
		List<Oferta> offers = new ArrayList<Oferta>();
		offers.addAll(excursions);
		offers.addAll(promos);
		
		return offers;
	}
}
