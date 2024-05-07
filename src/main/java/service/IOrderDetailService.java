package service;

import java.util.List;

import Model.OrdersDetailsModel;

public interface IOrderDetailService {
	int create(OrdersDetailsModel ordersDetails);
	List<OrdersDetailsModel> findByOrder(int id);
}
