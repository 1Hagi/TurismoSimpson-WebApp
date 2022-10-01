package persistence;

import model.Excursion;
import model.OfertaTipo;
import persistence.commons.GenericDAO;

public interface ExcursionDAO extends GenericDAO<Excursion> {

	public abstract Excursion findByUsername(String username);

	public abstract OfertaTipo toTipo(int tipoFavorito);

}
