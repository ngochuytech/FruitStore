package Controller.User;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet(urlPatterns = {"/updateCart"})
public class updateTocart extends HttpServlet{

	@Inject
	private IProductService productService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id;
		Boolean isIncrease = false;
		if(req.getParameter("action").equals("up"))
			isIncrease = true;
		if(req.getParameter("productId")!=null) {
			id = Integer.parseInt(req.getParameter("productId"));
			ProductModel productModel = productService.findById(id);
			// Kiểm tra xem sản phẩm này có trong CSDL không ?
			if(productModel!=null) {
				List<OrdersDetailsModel> listItem = (List<OrdersDetailsModel>)SessionUtil.getInstance().getValue(req, "orderDetail");
				for(int i=0;i<listItem.size();i++) {
					OrdersDetailsModel item = listItem.get(i);
				    if(item.getProduct().getId()==productModel.getId()) {
						if(isIncrease==false)
						{
							item.setQuantity(item.getQuantity()-1);
							if(item.getQuantity()==0)
							{
								listItem.remove(item);
							}
						}
						else {
							item.setQuantity(item.getQuantity()+1);
						}
					}
				}
//					for(OrdersDetailsModel item : listItem) {
//						if(item.getProduct().getId()==productModel.getId()) {
//							if(isIncrease==false)
//							{
//								item.setQuantity(item.getQuantity()-1);
//								if(item.getQuantity()==0)
//								{
//									listItem.remove(item);
//								}
//							}
//							else {
//								item.setQuantity(item.getQuantity()+1);
//							}
//						}
//					}
					SessionUtil.getInstance().putValue(req, "orderDetail", listItem);
				resp.sendRedirect(req.getContextPath()+"/cart");
			}
		}
	}
}
