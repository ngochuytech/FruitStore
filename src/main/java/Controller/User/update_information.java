package Controller.User;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AccountModel;
import Model.UserModel;
import service.IAccountService;
import service.IUserService;
import utils.SessionUtil;

@WebServlet(urlPatterns = {"/update_information"})
public class update_information extends HttpServlet{

	@Inject
	private IUserService userService;
	@Inject
	private IAccountService accountService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel account = (AccountModel) SessionUtil.getInstance().getValue(req, "acc");
		UserModel user = account.getUser();
		
		req.setAttribute("userName", user.getuName());
		req.setAttribute("userEmail", user.getEmail());
		req.setAttribute("userPhone", user.getSdt());
		req.setAttribute("userAddress", user.getAddress());
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/update_information.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel account = (AccountModel) SessionUtil.getInstance().getValue(req, "acc");
		UserModel user = account.getUser();
		String name =  req.getParameter("txtName");
		String email = req.getParameter("txtEmail");
		String phone = req.getParameter("txtPhone");
		String address = req.getParameter("txtAddress");
		userService.updateInformation(user.getUserId(), name, phone, address, email);
		
		SessionUtil.getInstance().removeValue(req, "acc");
		AccountModel accountModel = accountService.findByUsernameAndPassword(account.getUsername(), account.getPassword());
		SessionUtil.getInstance().putValue(req, "acc", accountModel);
		
		resp.sendRedirect(req.getContextPath()+"/user_information");
	}
}
