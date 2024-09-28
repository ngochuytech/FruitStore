package Controller.Admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IProductService;

@WebServlet(urlPatterns = {"/addProduct"})
public class addProduct extends HttpServlet{
	
	@Inject
	private IProductService productService;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int category = Integer.parseInt(req.getParameter("category"));
		String name = req.getParameter("txtNameProduct");
		float price = Float.parseFloat(req.getParameter("txtPriceProduct"));
		String describe = req.getParameter("txtDescribeProduct");
		String image = req.getParameter("txtImageProduct");
		productService.insertProduct(name, category, price, describe, image);
		resp.sendRedirect(req.getContextPath()+"/admin_manage_product");
	}
}
