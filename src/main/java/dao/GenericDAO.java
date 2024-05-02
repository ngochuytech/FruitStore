package dao;

import java.util.List;

import mapper.RowMapper;

public interface GenericDAO <T> {
	<T> List<T> query(String sql, RowMapper<T> rowMapper, Object... paramaters);
	void update (String sql, Object... parameters);
	void delete (String sql, Object... parameters);
	int insert (String sql, Object... parameters);
	int count (String sql,Object... parameters);
}
