package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.CategoryModel;
import mapper.RowMapper;

public class CategoryMapper implements RowMapper<CategoryModel>{

	@Override
	public CategoryModel mapRow(ResultSet rs) {
		try {
			CategoryModel categoryModel = new CategoryModel();
			categoryModel.setId(rs.getInt("IDcate"));
			categoryModel.setName(rs.getString("CategoryName"));
			return categoryModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
