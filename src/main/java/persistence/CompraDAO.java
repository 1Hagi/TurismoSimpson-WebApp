package persistence;

import java.util.List;

import model.Oferta;
import persistence.commons.GenericDAO;

public interface CompraDAO extends GenericDAO<Oferta> {
	
	public abstract List<Oferta> findByUsuarioID(Integer id);

	int insert(Integer id, Oferta oferta);

	List<Oferta> findbyIDUserAll(Integer id);
	
	
}
