package Controller.User;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.AccountModel;
import Model.OrdersDetailsModel;
import Model.OrdersModel;
import Model.UserModel;
import service.IOrderDetailService;
import service.IOrderService;
import utils.SessionUtil;

@WebServlet(urlPatterns = {"/checkout"})
public class checkout extends HttpServlet{

	@Inject
	private IOrderService orderService;
	
	@Inject
	private IOrderDetailService orderDetailService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel account = (AccountModel) SessionUtil.getInstance().getValue(req, "acc");
		UserModel user = account.getUser();
		req.setAttribute("UserName", user.getuName());
		req.setAttribute("UserEmail", user.getEmail());
		req.setAttribute("UserPhone", user.getSdt());
		req.setAttribute("UserAddress", user.getAddress());
		req.getRequestDispatcher("/views/user/checkout.jsp").forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel account = (AccountModel) SessionUtil.getInstance().getValue(req, "acc");
		UserModel user = account.getUser();
		List<OrdersDetailsModel> listItem = (List<OrdersDetailsModel>)SessionUtil.getInstance().getValue(req, "orderDetail");
		if(listItem!=null) {
			OrdersModel order = new OrdersModel();
//			SimpleDateFormat format =  new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
//			order.setDate_Create(format.format(new Date()));
			int idOrder = orderService.create(user);
			float TongTien = 0;
			for(int i=0;i<listItem.size();i++) {
				OrdersDetailsModel item = listItem.get(i);
				item.setOrders(idOrder);
				orderDetailService.create(item);
				TongTien += item.getQuantity() * item.getPrice();
			}
			
			order.setTotal_Price(TongTien);
			orderService.updateTotalPrice(idOrder, TongTien);
			System.out.println("Tạo đơn hàng thành công");	
			SessionUtil.getInstance().removeValue(req, "orderDetail");
			resp.sendRedirect(req.getContextPath()+"/home");
		}
		else {
			System.out.println("Không có sản phẩm trong giỏ hàng");
			resp.sendRedirect(req.getContextPath()+"/cart");
		}
	}
	
}
