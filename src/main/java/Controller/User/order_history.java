package Controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AccountModel;
import Model.OrdersDetailsModel;
import Model.OrdersModel;
import Model.UserModel;
import service.IOrderDetailService;
import service.IOrderService;
import utils.SessionUtil;

@WebServlet(urlPatterns = {"/order_history"})
public class order_history extends HttpServlet{

	@Inject
	private IOrderService orderService;
	
	@Inject
	private IOrderDetailService orderDetailService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel account = (AccountModel) SessionUtil.getInstance().getValue(req, "acc");
		UserModel user = account.getUser();
		List<OrdersModel> order = orderService.findByUser(user.getUserId());
		List<List<OrdersDetailsModel>> orderDList = new ArrayList<List<OrdersDetailsModel>>();
		List<Integer> id_modal = new ArrayList<Integer>();
		List<Integer> sizeOrderDetail = new ArrayList<Integer>();
		for(int i=0;i<order.size();i++) {
			List<OrdersDetailsModel> orderDetail = orderDetailService.findByOrder(order.get(i).getId());
			id_modal.add(i);
			sizeOrderDetail.add(orderDetail.size()-1);
			orderDList.add(orderDetail);
		}
		req.setAttribute("endList", sizeOrderDetail);
		req.setAttribute("ListIdModal", id_modal);
		req.setAttribute("order", order);
		req.setAttribute("orderDList", orderDList);
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/order_history.jsp");	
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Chức năng khách hàng hủy đơn khi đơn hàng chưa được duyệt
		int idOrder = Integer.parseInt(req.getParameter("orderId"));
		orderService.updateStatus(idOrder,"Đã hủy đơn bởi khách hàng");
		orderService.updateDate_Confirm(idOrder);
		resp.sendRedirect(req.getContextPath()+"/order_history");
	}
}
