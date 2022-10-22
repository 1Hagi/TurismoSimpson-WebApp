package persistence;

import model.Excursion;
import model.OfertaTipo;
import persistence.commons.GenericDAO;

public interface ExcursionDAO extends GenericDAO<Excursion> {

	public abstract Excursion findByID(Integer id);

	public abstract OfertaTipo toTipo(int tipoFavorito);

	public abstract int updateCupo(Excursion excursion);
	
}
