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

@WebServlet(urlPatterns = {"/shop"})
public class shop extends HttpServlet{
	
	@Inject
	private IProductService productService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		// isSearch = Có dùng chức năng tìm kiếm không ( False: Không - True: Có)
		boolean isSearch = true;
		int soluongTrang = 0;
		String search = req.getParameter("txtSearch");
		if(search==null || search == "")
		{
			search = "";
			isSearch = false;
			soluongTrang = productService.getSizeAll()/9;
		}
		else
		{
			soluongTrang = productService.countByName(search)/9;
		}
		if(soluongTrang==0 || soluongTrang%9!=0)
		{
			soluongTrang++;
		}
		req.setAttribute("textSearch", search);
		String trangHienTai = req.getParameter("index");
		if(trangHienTai==null)
			trangHienTai="1";
		int currentPage = Integer.parseInt(trangHienTai);
		List<ProductModel> listTrang;
		if(isSearch==false)
			listTrang = productService.pagingProduct(currentPage);
		else
			listTrang = productService.findByName(search, currentPage);
		req.setAttribute("listP", listTrang);
		req.setAttribute("endPage", soluongTrang);
		req.setAttribute("currPage", currentPage);
		
		int soLuongtraiCay = productService.countByCategory("Trái cây");
		int soLuongrauCu = productService.countByCategory("Rau củ");
		int soLuongnhapKhau = productService.countByCategory("Trái cây nhập khẩu");
		
		req.setAttribute("traiCay", soLuongtraiCay);
		req.setAttribute("rauCu", soLuongrauCu);
		req.setAttribute("soLuongnhapKhau", soLuongnhapKhau);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/shop.jsp");
		rd.forward(req, resp);
	}
}
