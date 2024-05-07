package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.OrdersDetailsModel;
import Model.ProductModel;
import mapper.RowMapper;

public class OrdersDetailMapper implements RowMapper<OrdersDetailsModel>{

	@Override
	public OrdersDetailsModel mapRow(ResultSet rs) {
		try {
			OrdersDetailsModel detailsModel = new OrdersDetailsModel();
			detailsModel.setId(rs.getInt("ID"));
			detailsModel.setQuantity(rs.getInt("Quantity"));
			detailsModel.setPrice(rs.getFloat("Price"));
			detailsModel.setOrders(rs.getInt("ID_Order"));
			detailsModel.setId_product(rs.getInt("ID_Product"));
			ProductModel productModel = new ProductMapper().mapRow(rs);
			detailsModel.setProduct(productModel);
			return detailsModel;
		}  catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
