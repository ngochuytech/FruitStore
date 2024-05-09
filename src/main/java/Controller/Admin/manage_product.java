package Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProductModel;
import service.IProductService;

@WebServlet(urlPatterns = {"/admin_manage_product"})
public class manage_product extends HttpServlet{
	
	@Inject
	private IProductService productService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductModel> listProduct = productService.getAllproduct();
		req.setAttribute("listProduct", listProduct);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/manage_product.jsp");	
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("productId"));
		String name = req.getParameter("txtNameProduct");
		int quantity = Integer.parseInt(req.getParameter("txtQuantityProduct"));
		float price = Float.parseFloat(req.getParameter("txtPriceProduct"));
		String describe = req.getParameter("txtDescribeProduct");
		String image = req.getParameter("txtImageProduct");
		productService.updateProduct(id, name, quantity, price, describe, image);
		resp.sendRedirect(req.getContextPath()+"/admin_manage_product");
	}
}
