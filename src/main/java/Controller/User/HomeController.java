package Controller.User;

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

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet{
	
	@Inject
	private IProductService productService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ProductModel> list = productService.getAll();
		req.setAttribute("listP", list);
		
		List<ProductModel> listProductTraiCay= productService.findbyCategory("Trái cây");
		req.setAttribute("listPtraiCay", listProductTraiCay);
		
		List<ProductModel> listProductRauCu = productService.findbyCategory("Rau củ");
		req.setAttribute("listPrauCu", listProductRauCu);
		
		List<ProductModel> listProductNhapKhau = productService.findbyCategory("Trái cây nhập khẩu");
		req.setAttribute("listPnhapKhau", listProductNhapKhau);
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/Home.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
