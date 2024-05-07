package Controller.Auth;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AccountModel;
import Model.RoleModel;
import Model.UserModel;
import service.IAccountService;
import utils.FormUtil;

@WebServlet(urlPatterns = {"/register"})
public class registerController extends HttpServlet{

	@Inject
	private IAccountService accountService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = FormUtil.toModel(AccountModel.class, req);
		UserModel userModel = FormUtil.toModel(UserModel.class, req);
		RoleModel roleModel = FormUtil.toModel(RoleModel.class, req);
		String name = req.getParameter("yourName");
		String email = req.getParameter("Email");
		String password = req.getParameter("password");
		String reppassword = req.getParameter("repeatPassword");
		accountModel.setUsername(email);
		accountModel.setPassword(password);
		// Cần xử lý thêm thông tin như email, name, số điện thoại, cccd vào user để có thông tin ...
		userModel.setEmail(email);
		userModel.setuName(name);
		userModel.setRolemodel(roleModel);
		accountModel.setUser(userModel);
		// error: Kiểm tra xem trong Database đã có email chưa, nếu chưa có (null).
		AccountModel error =  accountService.findByUsername(email);
		// Đăng ký thành công - Truyền account vào bảng account trong Database
		if(error==null && password.equals(reppassword)) {
			accountService.insert(accountModel);
			resp.sendRedirect(req.getContextPath()+"/login");
			return;
		}
		else if(password != reppassword)
			req.setAttribute("mess", "Mật khẩu của bạn không trùng khớp, vui lòng thử lại");
		else if(password == "")
			req.setAttribute("mess", "Mật khẩu của bạn không được bỏ trống, vui lòng thử lại");
		else
			req.setAttribute("mess", "Email của bạn đã tồn tại, vui lòng thử lại");
		req.setAttribute("anounc","alert alert-danger");
		req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
	}
}
