package Dao;

import java.util.ArrayList;
import java.util.List;

import model.News;

public interface DAOInterface<T> {
	public ArrayList<T> selectAll();

	List<News> findAll();

	News findById(String id);

	void create(News item);

	void update(News item);

	void deleteById(String id);
}
