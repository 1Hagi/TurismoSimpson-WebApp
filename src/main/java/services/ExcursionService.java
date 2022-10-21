package services;


import java.util.List;

import model.Excursion;
import model.OfertaTipo;
import persistence.ExcursionDAO;
import persistence.commons.DAOFactory;

public class ExcursionService {
	
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
	
	public List<Excursion> list() {
		
		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();	
		List<Excursion> excursiones = excursionDAO.findAll();
		
		return excursiones;
	}
	
	public Boolean delete(Integer id) {
		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
		return excursionDAO.delete(id);
	}

	public Excursion find(Integer id) {
		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
		Excursion excursion = excursionDAO.findByID(id);
		return excursion;
	}

	public Excursion update(Integer id, String nombre, double costo, Integer tiempo, Integer cupo, int tipo_oferta, String fileName,
			String descripcion) {
		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
		OfertaTipo ofertaTipo = excursionDAO.toTipo(tipo_oferta);

		Excursion excursion = new Excursion(nombre, fileName, id, ofertaTipo, tiempo, costo, cupo, descripcion, "0");

		if (excursion.isValid()) {
			excursionDAO.update(excursion);
			// XXX: si no devuelve "1", es que hubo más errores
		}
		
		return excursion;
	}
	
	
}
