package Controller.User;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProductModel;
import service.IProductService;

@WebServlet(urlPatterns = {"/shop-detail"})
public class shop_detail extends HttpServlet{
	@Inject
	private IProductService productService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idProduct = req.getParameter("productId");
		ProductModel product = productService.findById(Integer.parseInt(idProduct));
		req.setAttribute("product", product);
		req.getRequestDispatcher("/views/user/shop-detail.jsp").forward(req, resp);
	}
}
