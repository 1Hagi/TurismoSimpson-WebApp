package services;

import model.Usuario;
import model.nullobjects.NullUser;
import persistence.UsuarioDAO;
import persistence.commons.DAOFactory;

public class RegisterService {
	
	public Usuario register(String username, String password) {
		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
		Usuario usuario = usuarioDAO.findByUsername(username);
		
		if(usuario == null || !usuario.checkPassword(password)) {
			usuario = NullUser.build();
		}
		
		return usuario;
	}
}
