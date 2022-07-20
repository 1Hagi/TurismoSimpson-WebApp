package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.OfertaTipo;
import model.Usuario;
import persistence.UsuarioDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.MissingDataException;

public class UsuarioDAOImpl implements UsuarioDAO {

	public int insert(Usuario usuario) {
		try {
			String sql = "INSERT INTO USERS (USERNAME, PASSWORD) VALUES (?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public List<Usuario> findAll() {
		try {
			String sql = "SELECT * FROM usuarios";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();
			
			List<Usuario> usuarios = new LinkedList<Usuario>();
			while (resultados.next()) {
				usuarios.add(toUsuario(resultados));
			}
			
			return usuarios;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public int countAll() {
		try {
			String sql = "SELECT COUNT(1) AS TOTAL FROM usuarios";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();
			
			resultados.next();
			int total = resultados.getInt("TOTAL");
			
			return total;
		} catch(Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public int update(Usuario t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Usuario t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Usuario findByUsername(String username) {
		String sql = "SELECT * FROM usuarios WHERE nombre = ?";
		Connection conn;
		PreparedStatement statement;
		ResultSet resultados = null;
		Usuario usuario = null;
		try {
			conn = ConnectionProvider.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setString(1, username);
			resultados = statement.executeQuery();

			if (resultados.next()) {
				usuario = toUsuario(resultados);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usuario;
	}
	
	private Usuario toUsuario(ResultSet resultados) {
		try {
			return new Usuario(resultados.getString("nombre"), resultados.getString("contraseña"), resultados.getString("admin"), toTipo(resultados.getInt("fk_id_favorito")), resultados.getInt("tiempo_disponible"), resultados.getDouble("dinero_disponible"));

		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	private OfertaTipo toTipo(int id) {
		switch(id) {
		case 1:
			return OfertaTipo.VISITAGUIADA;
		case 2:
			return OfertaTipo.ENTRETENIMIENTO;
		case 3:
			return OfertaTipo.TERROR;
		case 4:
			return OfertaTipo.RESTORAN;
		case 5:
			return OfertaTipo.FIESTA;
		case 6:
			return OfertaTipo.TIENDA;
		}
		return OfertaTipo.VISITAGUIADA;
	}
}
