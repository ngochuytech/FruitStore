package service;

import java.util.List;

import Model.OrdersModel;
import Model.UserModel;

public interface IOrderService {
	int create(UserModel user);
	void updateTotalPrice(int id, float Total);
	List<OrdersModel> getAll();
	List<OrdersModel> findByUser(int id);
}
