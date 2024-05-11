package dao.implement;

import java.util.List;

import Model.OrdersModel;
import Model.UserModel;
import dao.IOrderDAO;
import mapper.implement.OrderMapper;

public class OrderDAO extends AbstractDAO<OrdersModel> implements IOrderDAO {

	@Override
	public int create(UserModel user) {
		String sql = "Insert into Orders(ID_User,Status) values (?,N'Đang chờ duyệt')";
		return insert(sql, user.getUserId());
	}

	@Override
	public void updateTotalPrice(int id, String address, float Total) {
		String sql = "update Orders\r\n"
				+ "set Total_price = ?, Delivery_Address = ?\r\n"
				+ "where ID=?";
		update(sql, Total, address, id);
	}

	@Override
	public List<OrdersModel> getAll() {
		String sql = "select * from Orders";
		List<OrdersModel> list = query(sql, new OrderMapper());
		return list;
	}

	@Override
	public List<OrdersModel> findByUser(int id) {
		String sql = "Select Orders.ID,((CONVERT([varchar](20),Date_Created,(105))+' ')+CONVERT([varchar](20),Date_Created,(108))) as Date_Created,((CONVERT([varchar](20),Date_Confirm,(105))+' ')+CONVERT([varchar](20),Date_Confirm,(108))) as Date_Confirm, Delivery_Address, ID_User,Total_price,[Status],[User].IDuser,[User].userName,[User].Number,[User].[Address],[User].Email,[User].roleId,[Role].roleId,[Role].roleName from Orders\r\n"
				+ "inner join [User] on [User].IDuser=Orders.ID_User\r\n"
				+ "inner join [Role] on [Role].roleId = [User].roleId\r\n"
				+ "where Orders.ID_User = ?";
		List<OrdersModel> list = query(sql, new OrderMapper(), id);
		return list;
	}

	@Override
	public List<OrdersModel> getAllbyWaiting() {
		String sql = "Select Orders.ID,((CONVERT([varchar](20),Date_Created,(105))+' ')+CONVERT([varchar](20),Date_Created,(108))) as Date_Created,((CONVERT([varchar](20),Date_Confirm,(105))+' ')+CONVERT([varchar](20),Date_Confirm,(108))) as Date_Confirm, Delivery_Address, ID_User,Total_price,[Status],[User].IDuser,[User].userName,[User].Number,[User].[Address],[User].Email,[User].roleId,[Role].roleId,[Role].roleName from Orders\r\n"
				+ "inner join [User] on [User].IDuser=Orders.ID_User\r\n"
				+ "inner join [Role] on [Role].roleId = [User].roleId "
				+ "where [Status] = N'Đang chờ duyệt'";
		List<OrdersModel> list = query(sql, new OrderMapper());
		return list;
	}

	@Override
	public void updateStatus(int id, String status) {
		String sql = "Update Orders set [Status] = ? where ID = ?";
		update(sql, status, id);
	}

	@Override
	public void updateDate_Confirm(int id) {
		String sql = "update Orders\r\n"
				+ "set Date_Confirm = ((CONVERT([varchar](20),getdate(),(105))+' ')+CONVERT([varchar](20),getdate(),(108)))\r\n"
				+ "where ID = ?";
		update(sql,id);
	}


}
