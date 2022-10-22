package services;


import java.util.HashMap;
import java.util.Map;
import model.Promocion;
import model.Usuario;
import persistence.ExcursionDAO;
import persistence.PromocionDAO;
import persistence.UsuarioDAO;
import persistence.commons.DAOFactory;

public class CompraService {
	
	ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
	PromocionDAO promocionDAO = DAOFactory.getPromocionDAO();
	UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
	
	public Map<String, String> compraProm(Integer usuarioID, Integer promocionID) {
		
		Map<String, String> errors = new HashMap<String, String>();

		Usuario usuario = usuarioDAO.findByID(usuarioID);
		Promocion promocion = promocionDAO.findByID(promocionID);

		if (!promocion.hayCupoDisponible()) {
			errors.put("attraction", "No hay cupo disponible");
		}
		if (!usuario.tieneDineroPara(promocion)) {
			errors.put("user", "No tienes dinero suficiente");
		}
		if (!usuario.tieneTiempoPara(promocion)) {
			errors.put("user", "No tienes tiempo suficiente");
		}

		if (errors.isEmpty()) {
			// Descuenta tiempo y dinero del usuario correspondiente a la oferta comprada,
			// Y agrega a su itinerario dicha oferta.
			usuario.comprar(promocion);
			// Se descuenta una unidad de cupo;
			promocion.venderCupo();

			promocionDAO.updateCupo(promocion);
			usuarioDAO.update(usuario);
			
		}

		return errors;
	}
}
