package service;

import java.util.List;

import Model.OrdersModel;
import Model.UserModel;

public interface IOrderService {
	int create(UserModel user);
	void updateTotalPrice(int id, String address, float Total);
	void updateStatus(int id, String status);
	void updateDate_Confirm(int id);
	List<OrdersModel> getAll();
	List<OrdersModel> getAllbyWaiting();
	List<OrdersModel> getAllbyStatusAndDate(String status, String Date);
	List<OrdersModel> findByUser(int id);
}
