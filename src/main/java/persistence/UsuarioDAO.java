package persistence;

import model.Usuario;
import persistence.commons.GenericDAO;

public interface UsuarioDAO extends GenericDAO<Usuario> {

	public abstract Usuario findByUsername(String username);
	
	public abstract Usuario findByID(Integer id);

	boolean delete(Integer id);

}
