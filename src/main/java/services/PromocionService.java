package services;


import java.util.ArrayList;
import java.util.List;

import model.Excursion;
import model.OfertaTipo;
import model.PromoAbsoluta;
import model.Promocion;
import persistence.ExcursionDAO;
import persistence.PromocionDAO;
import persistence.commons.DAOFactory;

public class PromocionService {
	
	public Excursion create(String nombre, Double costo, Integer tiempo, Integer cupo, int tipo_oferta, String fileName, String descripcion) {

		ExcursionDAO tipoExcursionDAO = DAOFactory.getExcursionDAO();
		OfertaTipo ofertaTipo = tipoExcursionDAO.toTipo(tipo_oferta);
		
		Excursion excursion = new Excursion(nombre, fileName, 0, ofertaTipo, tiempo, costo, cupo, descripcion, "0");

		if (excursion.isValid()) {
			ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
			excursionDAO.insert(excursion);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return excursion;
	}
	
	public List<Promocion> list() {
		
		PromocionDAO promocionDAO = DAOFactory.getPromocionDAO();	
		List<Promocion> promociones = promocionDAO.findAll();
		
		return promociones;
	}
	
	public Boolean delete(Integer id) {
		PromocionDAO promocionDAO = DAOFactory.getPromocionDAO();
		return promocionDAO.delete(id);
	}

	public Promocion find(Integer id) {
		PromocionDAO promocionDAO = DAOFactory.getPromocionDAO();
		Promocion promocion = promocionDAO.findByID(id);
		return promocion;
	}

	public Promocion update(Integer id, String nombre, double costo, Integer tiempo, Integer cupo, int tipo_oferta, String fileName,
			String descripcion) {
		PromocionDAO promocionDAO = DAOFactory.getPromocionDAO();
		OfertaTipo ofertaTipo = promocionDAO.toTipo(tipo_oferta);
//
		Promocion promocion = new PromoAbsoluta(nombre, fileName, id, ofertaTipo, new ArrayList<Excursion>(), costo, descripcion, "0");
//
//		if (promocion.isValid()) {
//			promocionDAO.update(excursion);
//			// XXX: si no devuelve "1", es que hubo más errores
//		}
//		
		return promocion;
	}
	
	
}
