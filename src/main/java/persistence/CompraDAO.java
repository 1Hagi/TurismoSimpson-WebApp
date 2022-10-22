package persistence;

import model.Itinerario;
import model.Usuario;
import persistence.commons.GenericDAO;

public interface CompraDAO extends GenericDAO<Itinerario> {
	
	public abstract Itinerario findByID(Integer id);

	boolean delete(Integer id);

}
