package service.implement;

import java.util.List;

import javax.inject.Inject;

import Model.OrdersModel;
import Model.UserModel;
import dao.IOrderDAO;
import service.IOrderService;

public class OrderService implements IOrderService{

	@Inject
	private IOrderDAO orderDAO;

	@Override
	public int create(UserModel user) {
		return orderDAO.create(user);
	}

	@Override
	public void updateTotalPrice(int id, float Total) {
		orderDAO.updateTotalPrice(id, Total);
	}

	@Override
	public List<OrdersModel> getAll() {
		return orderDAO.getAll();
	}

	@Override
	public List<OrdersModel> findByUser(int id) {
		return orderDAO.findByUser(id);
	}
	
	
}
