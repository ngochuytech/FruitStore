package dao.implement;

import java.util.List;

import Model.OrdersDetailsModel;
import dao.IOrdersDetailDAO;
import mapper.implement.OrdersDetailMapper;
import service.implement.OrderDetailService;

public class OrdersDetailDAO extends AbstractDAO<OrdersDetailsModel> implements IOrdersDetailDAO{

	@Override
	public int create(OrdersDetailsModel ordersDetails) {
		String sql = "Insert into Orders_Details(ID_Product,Quantity,Price,ID_Order) values(?,?,?,?)";
		return insert(sql, ordersDetails.getProduct().getId(),ordersDetails.getQuantity(),ordersDetails.getPrice(),ordersDetails.getOrders());
	}

	@Override
	public List<OrdersDetailsModel> findByOrder(int id) {
		String sql = "select * from Orders_Details \r\n"
				+ "inner join Products on Orders_Details.ID_Product = Products.ID\r\n"
				+ "inner join Category on Products.ID_Category = Category.IDcate\r\n"
				+ "where ID_Order = ?";
		List<OrdersDetailsModel> list = query(sql, new OrdersDetailMapper(), id);
		return list;
	}

}
