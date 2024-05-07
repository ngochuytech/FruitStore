package mapper.implement;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.OrdersModel;
import mapper.RowMapper;

public class OrderMapper implements RowMapper<OrdersModel>{

	@Override
	public OrdersModel mapRow(ResultSet rs) {
		try {
			OrdersModel ordersModel = new OrdersModel();
			ordersModel.setId(rs.getInt("ID"));
			ordersModel.setDate_Create(rs.getString("Date_Created"));
			ordersModel.setTotal_Price(rs.getFloat("Total_price"));
			ordersModel.setStatus(rs.getString("Status"));
			return ordersModel;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
