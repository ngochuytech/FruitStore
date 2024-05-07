package dao;

import java.util.List;

import Model.OrdersModel;
import Model.UserModel;

public interface IOrderDAO {
	int create(UserModel user);
	void updateTotalPrice(int id, float Total);
	void updateStatus(int id, String status);
	List<OrdersModel> getAll();
	List<OrdersModel> getAllbyWaiting();
	List<OrdersModel> findByUser(int id);
}
