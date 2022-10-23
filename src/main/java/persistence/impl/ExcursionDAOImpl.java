package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Excursion;
import model.OfertaTipo;
import persistence.ExcursionDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.MissingDataException;

public class ExcursionDAOImpl implements ExcursionDAO {

	public int insert(Excursion excursion) {
		try {
			String sql = "INSERT INTO excursiones (nombre, costo, tiempo, descripcion, id_tipo, imagen_ruta, cupo) VALUES (?, ?, ?, ?, ?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, excursion.getNombre());
			statement.setDouble(2, excursion.getCosto());
			statement.setInt(3, excursion.getTiempo());
			statement.setString(4, excursion.getDescripcion());
			statement.setInt(5, ofertaToNumber(excursion.getTipo()));
			statement.setString(6, excursion.getImg());
			statement.setInt(7, excursion.getCupo());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public List<Excursion> findAll() {
		try {
			String sql = "SELECT * FROM excursiones";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();
			
			List<Excursion> excursiones = new ArrayList<Excursion>();
			while (resultados.next()) {
				excursiones.add(toExcursion(resultados));
			}
			
			return excursiones;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public int countAll() {
		try {
			String sql = "SELECT COUNT(1) AS TOTAL FROM excursiones";
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
	
	private Excursion toExcursion(ResultSet resultados) {
		try {
			return new Excursion(resultados.getString("nombre"), 
					resultados.getString("imagen_ruta"), 
					resultados.getInt("id"), 
					toTipo(resultados.getInt("id_tipo")), 
					resultados.getInt("tiempo"), 
					resultados.getDouble("costo"), 
					resultados.getInt("cupo"), 
					resultados.getString("descripcion"), 
					resultados.getString("soft_delete"));

		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	public OfertaTipo toTipo(int id) {
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
	
	public Excursion findByID(Integer id) {
		String sql = "SELECT * FROM excursiones WHERE id = ?";
		Connection conn;
		PreparedStatement statement;
		ResultSet resultado = null;
		Excursion excursion = null;
		try {
			conn = ConnectionProvider.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, id);
			resultado = statement.executeQuery();
			excursion = toExcursion(resultado);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return excursion;
	}

	@Override
	public int update(Excursion excursion) {
		try {
			String sql = "UPDATE usuarios SET nombre = ?, contraseña = ?, admin = ?, fk_id_favorito = ?, tiempo_disponible = ?, dinero_disponible = ? "
					+ "WHERE id = ?;";
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			
			statement.setString(1, excursion.getNombre());
			statement.setInt(2, ofertaToNumber(excursion.getTipo()));
			statement.setInt(3, excursion.getTiempo());
			statement.setDouble(4, excursion.getCosto());
			statement.setInt(5, excursion.getCupo());
			statement.setString(6, excursion.getDescripcion());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	@Override
	public int updateCupo(Excursion excursion) {
		try {
			String sql = "UPDATE excursiones SET cupo = ? WHERE id = ?;";
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			
			statement.setInt(1, excursion.getCupo());
			statement.setInt(2, excursion.getId());
;
			int rows = statement.executeUpdate();
			
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}	

	@Override
	public boolean delete(Integer id) {
		try {
			String sql = "UPDATE excursiones SET soft_delete = 1 "
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
}
