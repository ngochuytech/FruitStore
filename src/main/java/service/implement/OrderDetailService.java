package service.implement;

import java.util.List;

import javax.inject.Inject;

import Model.OrdersDetailsModel;
import dao.IOrdersDetailDAO;
import service.IOrderDetailService;

public class OrderDetailService implements IOrderDetailService{

	@Inject
	private IOrdersDetailDAO ordersDetail;

	@Override
	public int create(OrdersDetailsModel ordersDetails) {
		return ordersDetail.create(ordersDetails);
	}

	@Override
	public List<OrdersDetailsModel> findByOrder(int id) {
		return ordersDetail.findByOrder(id);
	}


}
