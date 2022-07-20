package persistence;

import model.Excursion;
import persistence.commons.GenericDAO;

public interface ExcursionDAO extends GenericDAO<Excursion> {

	public abstract Excursion findByUsername(String username);

}
