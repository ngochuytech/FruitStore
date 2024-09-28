package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.OrdersModel;
import Model.UserModel;
import mapper.RowMapper;

public class OrderMapper implements RowMapper<OrdersModel>{

	@Override
	public OrdersModel mapRow(ResultSet rs) {
		try {
			OrdersModel ordersModel = new OrdersModel();
			ordersModel.setId(rs.getInt("ID"));
			ordersModel.setDate_Create(rs.getString("Date_Created"));
			ordersModel.setDate_Confirm(rs.getString("Date_Confirm")+"");
			ordersModel.setAddress(rs.getString("Delivery_Address")+"");
			ordersModel.setTotal_Price(rs.getFloat("Total_price"));
			ordersModel.setStatus(rs.getString("Status"));
			UserModel user = new UserMapper().mapRow(rs);
			ordersModel.setUserModel(user);
			return ordersModel;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
