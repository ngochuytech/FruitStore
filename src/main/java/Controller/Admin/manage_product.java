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

import Model.CategoryModel;
import Model.ProductModel;
import service.ICategoryService;
import service.IProductService;

@WebServlet(urlPatterns = {"/admin_manage_product"})
public class manage_product extends HttpServlet{
	
	@Inject
	private IProductService productService;
	@Inject
	private ICategoryService categoryService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String search = req.getParameter("txtSearch");
		if(search==null)
			search="";
		req.setAttribute("textSearch", search);
		List<ProductModel> listProduct = productService.findbyname(search);
		List<CategoryModel> listCategory = categoryService.getAll();
		req.setAttribute("listProduct", listProduct);
		req.setAttribute("listCategory", listCategory);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/manage_product.jsp");	
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int category = Integer.parseInt(req.getParameter("category")) ;
		int id = Integer.parseInt(req.getParameter("productId"));
		String name = req.getParameter("txtNameProduct");
		int quantity = Integer.parseInt(req.getParameter("txtQuantityProduct"));
		float price = Float.parseFloat(req.getParameter("txtPriceProduct"));
		String describe = req.getParameter("txtDescribeProduct");
		String image = req.getParameter("txtImageProduct");
		productService.updateProduct(id, name, quantity, category, price, describe, image);
		resp.sendRedirect(req.getContextPath()+"/admin_manage_product");
	}
}
