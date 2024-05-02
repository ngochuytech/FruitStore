package dao.implement;

import java.util.List;

import Model.CategoryModel;
import dao.ICategoryDAO;
import mapper.implement.CategoryMapper;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO{

	@Override
	public List<CategoryModel> getAll() {
		String sql = "select * from Category";
		List<CategoryModel> list = query(sql, new CategoryMapper());
		return list;
	}
}
