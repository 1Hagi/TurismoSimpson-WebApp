package persistence;

import model.Promocion;
import persistence.commons.GenericDAO;

public interface PromocionDAO extends GenericDAO<Promocion> {
	
	public abstract Promocion findByUsername(String username);

	public abstract Promocion findByID(Integer promocionID);

	int updateCupo(Promocion promocion);

}
