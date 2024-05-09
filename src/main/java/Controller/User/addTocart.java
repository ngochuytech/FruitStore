package Controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.AccountModel;
import Model.OrdersDetailsModel;
import Model.OrdersModel;
import Model.ProductModel;
import Model.UserModel;
import service.IProductService;
import utils.SessionUtil;

@WebServlet(urlPatterns = {"/addTocart"})
public class addTocart extends HttpServlet{

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
				HttpSession session = req.getSession();
				// Kiểm tra xem trong giỏ hàng có sản phẩm nào chưa ?
				if(session.getAttribute("orderDetail")==null) {
					List<OrdersDetailsModel> listItem = new ArrayList<OrdersDetailsModel>();
					OrdersDetailsModel item = new OrdersDetailsModel();
					item.setQuantity(1);
					item.setProduct(productModel);
					item.setPrice(productModel.getPrice());
					listItem.add(item);
					SessionUtil.getInstance().putValue(req, "orderDetail", listItem);
				}
				else {
					List<OrdersDetailsModel> listItem = (List<OrdersDetailsModel>)SessionUtil.getInstance().getValue(req, "orderDetail");
					// Biến "check" để kiểm tra trong giỏ hàng đã có sản phẩm tương tự chưa, có rồi thì tăng số lượng lên 1
					boolean check = false;
					for(OrdersDetailsModel item : listItem) {
						if(item.getProduct().getId()==productModel.getId()) {
							item.setQuantity(item.getQuantity()+1);
							check = true;
						}
					}
					if(check==false) {
						OrdersDetailsModel item = new OrdersDetailsModel();
						item.setQuantity(1);
						item.setProduct(productModel);
						item.setPrice(productModel.getPrice());
						listItem.add(item);
					}
					SessionUtil.getInstance().putValue(req, "orderDetail", listItem);
				}
				resp.sendRedirect(req.getContextPath()+"/cart");
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id;
		int quantity;
		if(req.getParameter("productId")!=null) {
			id = Integer.parseInt(req.getParameter("productId"));
			quantity = Integer.parseInt(req.getParameter("quantity"));
			ProductModel productModel = productService.findById(id);
			// Kiểm tra xem sản phẩm này có trong CSDL không ?
			if(productModel!=null) {
				HttpSession session = req.getSession();
				// Kiểm tra xem trong giỏ hàng có sản phẩm nào chưa ?
				if(session.getAttribute("orderDetail")==null) {
					List<OrdersDetailsModel> listItem = new ArrayList<OrdersDetailsModel>();
					OrdersDetailsModel item = new OrdersDetailsModel();
					item.setQuantity(quantity);
					item.setProduct(productModel);
					item.setPrice(productModel.getPrice());
					listItem.add(item);
					SessionUtil.getInstance().putValue(req, "orderDetail", listItem);
				}
				else {
					List<OrdersDetailsModel> listItem = (List<OrdersDetailsModel>)SessionUtil.getInstance().getValue(req, "orderDetail");
					// Biến "check" để kiểm tra trong giỏ hàng đã có sản phẩm tương tự chưa, có rồi thì tăng số lượng lên 1
					boolean check = false;
					for(OrdersDetailsModel item : listItem) {
						if(item.getProduct().getId()==productModel.getId()) {
							item.setQuantity(item.getQuantity()+quantity);
							check = true;
						}
					}
					if(check==false) {
						OrdersDetailsModel item = new OrdersDetailsModel();
						item.setQuantity(quantity);
						item.setProduct(productModel);
						item.setPrice(productModel.getPrice());
						listItem.add(item);
					}
					SessionUtil.getInstance().putValue(req, "orderDetail", listItem);
				}
				resp.sendRedirect(req.getContextPath()+"/cart");
			}
		}
	}
}
