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
	public void updateTotalPrice(int id, float Total) {
		String sql = "Update Orders set Total_price = ? where ID = ?";
		update(sql, Total, id);
	}

	@Override
	public List<OrdersModel> getAll() {
		String sql = "select * from Orders";
		List<OrdersModel> list = query(sql, new OrderMapper());
		return list;
	}

	@Override
	public List<OrdersModel> findByUser(int id) {
		String sql = "Select ID,((CONVERT([varchar](20),Date_Created,(105))+' ')+CONVERT([varchar](20),Date_Created,(108))) as Date_Created,ID_User,Total_price,[Status] from Orders\r\n"
				+ "where Orders.ID_User = ?";
		List<OrdersModel> list = query(sql, new OrderMapper(), id);
		return list;
	}

}
