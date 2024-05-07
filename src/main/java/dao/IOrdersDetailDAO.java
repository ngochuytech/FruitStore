package dao;

import java.util.List;

import Model.OrdersDetailsModel;

public interface IOrdersDetailDAO {
	int create(OrdersDetailsModel ordersDetails);
	List<OrdersDetailsModel> findByOrder(int id);
}
