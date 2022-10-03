package services;


import java.util.List;
import model.OfertaTipo;
import model.Usuario;
import persistence.ExcursionDAO;
import persistence.UsuarioDAO;
import persistence.commons.DAOFactory;

public class UserService {
	
	public Usuario create(Integer id, String nombre, String contraseña, String admin, int tipoFavorito, Integer tiempoDisponible,
			Double dineroDisponible) {

		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
		OfertaTipo ofertaTipo = excursionDAO.toTipo(tipoFavorito);

		Usuario usuario = new Usuario(id, nombre, contraseña, admin, ofertaTipo, tiempoDisponible, dineroDisponible, "0");

		if (usuario.isValid()) {
			UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
			usuarioDAO.insert(usuario);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return usuario;
	}
	
	public List<Usuario> list() {
		
		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();	
		List<Usuario> usuarios = usuarioDAO.findAll();
		
		return usuarios;
	}

	public Usuario update(Integer id, String nombre, String contraseña, String admin, int tipoFavorito, Integer tiempoDisponible,
			Double dineroDisponible) {
		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
		OfertaTipo ofertaTipo = excursionDAO.toTipo(tipoFavorito);

		Usuario usuario = new Usuario(id, nombre, contraseña, admin, ofertaTipo, tiempoDisponible, dineroDisponible, "0");

		if (usuario.isValid()) {
			UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
			usuarioDAO.update(usuario);
			// XXX: si no devuelve "1", es que hubo más errores
		}
		
		return usuario;
	}
	
	public Boolean delete(Integer id) {
		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
		return usuarioDAO.delete(id);
	}

	public Usuario find(Integer id) {
		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
		Usuario usuario = usuarioDAO.findByID(id);
		return usuario;
	}
	
	
}
