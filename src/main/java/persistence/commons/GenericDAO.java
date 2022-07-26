package persistence.commons;

import java.util.List;

public interface GenericDAO<T> {

	public List<T> findAll();
	public int countAll();
	public int insert(T t);
	public int update(T t);
	boolean delete(Integer id);
}
