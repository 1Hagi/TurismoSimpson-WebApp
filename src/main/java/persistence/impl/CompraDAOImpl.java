package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Excursion;
import model.Oferta;
import persistence.CompraDAO;
import persistence.ExcursionDAO;
import persistence.PromocionDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.DAOFactory;
import persistence.commons.MissingDataException;

public class CompraDAOImpl implements CompraDAO {

	@Override
	public int insert(Integer id, Oferta oferta) {
		try {
			String sql = "INSERT INTO compras (id_comprador, id_excursion, id_promocion)"
					+ " VALUES (?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, id);
			if(oferta instanceof Excursion) {
				statement.setInt(2, oferta.getId());
				statement.setInt(3, 0);
			} else {
				statement.setInt(2, 0);
				statement.setInt(3, oferta.getId());
			}

			int rows = statement.executeUpdate();
			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	@Override
	public List<Oferta> findbyIDUserAll(Integer id) {
		try {
			String sql = "SELECT * FROM compras WHERE id_comprador = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet resultados = statement.executeQuery();
			
			List<Oferta> oferta = new ArrayList<Oferta>();
			while (resultados.next()) {
					oferta.add(toOferta(resultados));
			}
			
			return oferta;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}
	
	private Oferta toOferta(ResultSet resultados) {
		try {
			Integer id = resultados.getInt("id_excursion");
			if(id > 0) {
				ExcursionDAO excursionDAO = DAOFactory.getExcursionDAO();	
				Oferta oferta = excursionDAO.findByID(id);
				return oferta;
			}
			id = resultados.getInt("id_promocion");
			if(id > 0) {
				PromocionDAO promocionDAO = DAOFactory.getPromocionDAO();	
				Oferta oferta = promocionDAO.findByID(id);
				return oferta;
			}
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
		return null;
	}

	@Override
	public List<Oferta> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Oferta t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Oferta t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Oferta> findByUsuarioID(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
