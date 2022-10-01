package persistence.commons;

import persistence.ExcursionDAO;
import persistence.PromocionDAO;
import persistence.UsuarioDAO;
import persistence.impl.ExcursionDAOImpl;
import persistence.impl.PromocionDAOImpl;
import persistence.impl.UsuarioDAOImpl;

public class DAOFactory {

	public static UsuarioDAO getUsuarioDAO() {
		return new UsuarioDAOImpl();
	}
	
	public static ExcursionDAO getExcursionDAO() {
		return new ExcursionDAOImpl();
	}

	public static PromocionDAO getPromocionDAO() {
		return new PromocionDAOImpl();
	}
}
