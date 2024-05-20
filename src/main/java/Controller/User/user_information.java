package Controller.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AccountModel;
import Model.UserModel;
import utils.SessionUtil;

@WebServlet(urlPatterns = {"/user_information"})
public class user_information extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel account = (AccountModel) SessionUtil.getInstance().getValue(req, "acc");
		UserModel user = account.getUser();	
		req.setAttribute("UserRole", user.getRolemodel().getRoleId());
		req.setAttribute("UserName", user.getuName());
		req.setAttribute("UserEmail", user.getEmail());
		req.setAttribute("UserPhone", user.getSdt());
		req.setAttribute("UserAddress", user.getAddress());
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/user_information.jsp");
		rd.forward(req, resp);
	}
}
