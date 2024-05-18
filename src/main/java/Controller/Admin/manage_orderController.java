package Controller.Admin;

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

import Model.OrdersDetailsModel;
import Model.OrdersModel;
import service.IOrderDetailService;
import service.IOrderService;

@WebServlet(urlPatterns = {"/admin_manager_order"})
public class manage_orderController extends HttpServlet{

	@Inject
	private IOrderService orderService;
	@Inject
	private IOrderDetailService orderDetailService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<OrdersModel> order = orderService.getAllbyWaiting();
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
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/manage_order.jsp");	
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String idModal = req.getParameter("modalId");
		if(action!=null) {
			List<OrdersModel> order = orderService.getAllbyWaiting();
			if(action.equals("accept")) {		
				orderService.updateStatus(order.get(Integer.parseInt(idModal)).getId(), "Đã xác nhận");
			}
			else if(action.equals("cancel")) {
				orderService.updateStatus(order.get(Integer.parseInt(idModal)).getId(), "Đã hủy đơn");
			}
			orderService.updateDate_Confirm(order.get(Integer.parseInt(idModal)).getId());
		}
		resp.sendRedirect(req.getContextPath()+"/admin_manager_order");
	}
}
