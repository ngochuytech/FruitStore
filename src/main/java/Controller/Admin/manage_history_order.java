package Controller.Admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

@WebServlet(urlPatterns = {"/admin_manager_history_order"})
public class manage_history_order extends HttpServlet{

	@Inject 
	private IOrderService orderService;
	
	@Inject
	private IOrderDetailService orderDetailService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		// Để lấy ngày hiện tại
		Date date = new Date();
		 // Định dạng ngày theo kiểu yyyy-MM-dd
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = formatter.format(date);
        req.setAttribute("defaultDate", formattedDate);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/manage_history_order.jsp");	
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ValueStatus (Status) = 1 -> Đơn hàng đã duyệt ; Status = 2 -> Đơn hàng đã hủy
		String valueStatus = req.getParameter("kieu");
		String date = req.getParameter("date");
		int status = (Integer.parseInt(valueStatus));
		List<OrdersModel> order = null;
		if(status == 1)
		{
			order=orderService.getAllbyStatusAndDate("Đã xác nhận", date);
		}
		else
			order=orderService.getAllbyStatusAndDate("Đã hủy đơn", date);
		if(order==null)
		{
			req.setAttribute("defaultDate", date);
			RequestDispatcher rd = req.getRequestDispatcher("/views/admin/manage_history_order.jsp");	
			rd.forward(req, resp);
			return;
		}
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
		req.setAttribute("defaultDate", date);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/manage_history_order.jsp");	
		rd.forward(req, resp);
	}
}
