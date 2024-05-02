package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.CategoryModel;
import Model.ProductModel;
import mapper.RowMapper;

public class ProductMapper implements RowMapper<ProductModel>{

	@Override
	public ProductModel mapRow(ResultSet rs) {
		try {
			ProductModel productModel = new ProductModel();
			productModel.setId(rs.getInt("ID"));
			productModel.setName(rs.getString("Name"));
			productModel.setPrice(rs.getFloat("Price"));
			productModel.setQuantity(rs.getInt("Quantity"));
			productModel.setDescribe(rs.getString("Describe"));
			productModel.setImage(rs.getString("Image"));
			CategoryModel categoryModel = new CategoryMapper().mapRow(rs);
			productModel.setCategory(categoryModel);
			return productModel;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
