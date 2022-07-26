package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Excursion;

import model.OfertaTipo;
import model.PromoAbsoluta;
import model.PromoAxB;
import model.PromoPorcentual;
import model.Promocion;
import persistence.ExcursionDAO;
import persistence.PromocionDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.DAOFactory;
import persistence.commons.MissingDataException;

public class PromocionDAOImpl implements PromocionDAO {

	public int insert(Excursion excursion) {
		try {
			String sql = "INSERT INTO USERS (USERNAME, PASSWORD) VALUES (?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, excursion.getNombre());
			int rows = statement.executeUpdate();
			
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public List<Promocion> findAll() {
		try {
			String sql = "SELECT * FROM promociones";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();
			
			List<Promocion> promociones = new ArrayList<Promocion>();
			List<Excursion> excursiones = new ArrayList<Excursion>();
			ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
			excursiones = excursionDAO.findAll();
			
			while (resultados.next()) {
				promociones.add(toPromocion(resultados, excursiones));
			}
			
			return promociones;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public int countAll() {
		try {
			String sql = "SELECT COUNT(1) AS TOTAL FROM promociones";
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
	
	private Promocion toPromocion(ResultSet resultados, List<Excursion> excursiones) {
		
		try {
		Promocion unaPromocion = null;
		int tipoPromocion = resultados.getInt("fk_promocion_tipo");
		
		switch (tipoPromocion) {
		case 1:
			unaPromocion = new PromoAbsoluta(resultados.getString("nombre"), resultados.getString("imagen_ruta"), resultados.getInt("id"), 
					toTipo(resultados.getInt("fk_oferta_tipo")), listarExcursiones(resultados, excursiones), resultados.getDouble("costo_absoluto"), resultados.getString("descripcion"), resultados.getString("soft_delete"));
			break;
		case 2:
			unaPromocion = new PromoPorcentual(resultados.getString("nombre"), resultados.getString("imagen_ruta"), resultados.getInt("id"), 
					toTipo(resultados.getInt("fk_oferta_tipo")), listarExcursiones(resultados, excursiones), resultados.getInt("costo_porcentual"), resultados.getString("descripcion"), resultados.getString("soft_delete"));
			break;
		case 3:
			unaPromocion = new PromoAxB(resultados.getString("nombre"), resultados.getString("imagen_ruta"), resultados.getInt("id"), 
					toTipo(resultados.getInt("fk_oferta_tipo")), listarExcursiones(resultados, excursiones), resultados.getInt("costo_axb"), resultados.getString("descripcion"), resultados.getString("soft_delete"));
			break;
		}
		
		return unaPromocion;
		
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	private List<Excursion> listarExcursiones(ResultSet resultados, List<Excursion> excursiones) throws SQLException {
		List<Excursion> excursionesIncluidas = new ArrayList<Excursion>();
		for(int i = 1; i <= 5; i++) {
			if(resultados.getInt(4 + i) > 0) {
				for(Excursion e : excursiones) {
					if(e.getId() == resultados.getInt(4 + i)) {
							excursionesIncluidas.add(e);
					}
				}
			}
		}
		return excursionesIncluidas;
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

	@Override
	public int insert(Promocion t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateCupo(Promocion promocion) {
		List<Excursion> excursiones = promocion.getExcursiones();
		int rows = 0;
		try {
			for(Excursion excursion : excursiones) {
				ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
				excursionDAO.updateCupo(excursion);
				rows =+ 1;
			}
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public Promocion findByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public Promocion findByID(Integer id) {
		String sql = "SELECT * FROM promociones WHERE id = ?";
		Connection conn;
		PreparedStatement statement;
		ResultSet resultado = null;
		Promocion promocion = null;
		Integer excursionID;
		List<Excursion> excursiones = new ArrayList<Excursion>();
		ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();
		
		try {
			conn = ConnectionProvider.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, id);
			resultado = statement.executeQuery();
			
			for(int i = 1; i<=5; i++) {
				excursionID = resultado.getInt("excursion" + i);
				if(excursionID > 0) {
					excursiones.add(excursionDAO.findByID(excursionID));
				}
			}
			
			promocion = toPromocion(resultado, excursiones);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return promocion;
	}

	@Override
	public int update(Promocion t) {
		// TODO Auto-generated method stub
		return 0;
	}

}
