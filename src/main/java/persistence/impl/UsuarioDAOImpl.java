package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Oferta;
import model.OfertaTipo;
import model.Usuario;
import persistence.CompraDAO;
import persistence.UsuarioDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.DAOFactory;
import persistence.commons.MissingDataException;

public class UsuarioDAOImpl implements UsuarioDAO {

	public int insert(Usuario usuario) {
		try {
			String sql = "INSERT INTO usuarios (nombre, contraseña, admin, fk_id_favorito, tiempo_disponible, dinero_disponible)"
					+ " VALUES (?, ?, ?, ?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			statement.setString(2, usuario.getContraseña());
			statement.setBoolean(3, usuario.getAdmin());
			statement.setInt(4, ofertaToNumber(usuario.getFavorito()));
			statement.setInt(5, usuario.getTiempoDisponible());
			statement.setDouble(6, usuario.getDineroDisponible());
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
	public int update(Usuario usuario) {
		try {
			String sql = "UPDATE usuarios SET nombre = ?, contraseña = ?, admin = ?, fk_id_favorito = ?, tiempo_disponible = ?, dinero_disponible = ? "
					+ "WHERE id = ?;";
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			
			statement.setString(1, usuario.getNombre());
			statement.setString(2, usuario.getContraseña());
			statement.setBoolean(3, usuario.getAdmin());
			statement.setInt(4, ofertaToNumber(usuario.getFavorito()));
			statement.setInt(5, usuario.getTiempoDisponible());
			statement.setDouble(6, usuario.getDineroDisponible());
			statement.setInt(7, usuario.getId());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public boolean delete(Integer id) {
		try {
			String sql = "UPDATE usuarios SET soft_delete = 1 "
					+ "WHERE id = ?;";
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			
			statement.setInt(1, id);
			statement.executeUpdate();
			return true;
			
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
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
				
				//Obtener itinerario completo
				CompraDAO compraDAO = DAOFactory.getCompraDAO();
				List<Oferta> itinerario = compraDAO.findbyIDUserAll(usuario.getId());
				if(itinerario != null) {
					usuario.agregarOfertas(itinerario);
				}				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usuario;
	}
	
	private Usuario toUsuario(ResultSet resultados) {
		try {
			return new Usuario(resultados.getInt("id"), resultados.getString("nombre"), resultados.getString("contraseña"), resultados.getString("admin"), toTipo(resultados.getInt("fk_id_favorito")), resultados.getInt("tiempo_disponible"), resultados.getDouble("dinero_disponible"), resultados.getString("soft_delete"));

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
	
	private Integer ofertaToNumber(OfertaTipo ofertaTipo) {
		switch(ofertaTipo) {
		case VISITAGUIADA:
			return 1;
		case ENTRETENIMIENTO:
			return 2;
		case TERROR:
			return 3;
		case RESTORAN:
			return 4;
		case FIESTA:
			return 5;
		case TIENDA:
			return 6;
		}
		return 1;
	}

	@Override
	public Usuario findByID(Integer id) {
		String sql = "SELECT * FROM usuarios WHERE id = ?";
		Connection conn;
		PreparedStatement statement;
		ResultSet resultado = null;
		Usuario usuario = null;
		try {
			conn = ConnectionProvider.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, id);
			resultado = statement.executeQuery();
			usuario = toUsuario(resultado);
			
			//Obtener itinerario completo
			CompraDAO compraDAO = DAOFactory.getCompraDAO();
			List<Oferta> itinerario = compraDAO.findbyIDUserAll(id);
			if(itinerario != null) {
				usuario.agregarOfertas(itinerario);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
}
