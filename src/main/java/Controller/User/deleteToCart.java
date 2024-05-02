package Controller.User;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.OrdersDetailsModel;
import Model.ProductModel;
import service.IProductService;
import utils.SessionUtil;

@WebServlet(urlPatterns = {"/deleteCart"})
public class deleteToCart extends HttpServlet{

	@Inject
	private IProductService productService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id;
		if(req.getParameter("productId")!=null) {
			id = Integer.parseInt(req.getParameter("productId"));
			ProductModel productModel = productService.findById(id);
			// Kiểm tra xem sản phẩm này có trong CSDL không ?
			if(productModel!=null) {
					List<OrdersDetailsModel> listItem = (List<OrdersDetailsModel>)SessionUtil.getInstance().getValue(req, "orderDetail");
					Iterator<OrdersDetailsModel> iterator = listItem.iterator();
					while(iterator.hasNext()) {
					    OrdersDetailsModel item = iterator.next();
					    if(item.getProduct().getId() == productModel.getId()) {
					        iterator.remove(); // Sử dụng Iterator để xóa phần tử
					    }
					}
//					for(OrdersDetailsModel item : listItem) {
//						if(item.getProduct().getId()==productModel.getId()) {
//									listItem.remove(item);
//									System.out.println("Sản phẩm bị xóa");
//							}
//						}
					
					SessionUtil.getInstance().putValue(req, "orderDetail", listItem);
				resp.sendRedirect(req.getContextPath()+"/cart");
			}
		}
	}
}
