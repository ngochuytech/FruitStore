package Controller.Auth;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AccountModel;
import service.IAccountService;
import utils.SessionUtil;

@WebServlet(urlPatterns = "/login")
public class loginController extends HttpServlet{
	
	@Inject
	private IAccountService accountService;
	
	ResourceBundle bundle = ResourceBundle.getBundle("message");
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String message = req.getParameter("mess");
		if(message!=null) {
			req.setAttribute("mess", bundle.getString(message));
			req.setAttribute("anounc", "alert alert-danger");
		}
		req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);	
//		resp.sendRedirect(req.getContextPath()+"/views/auth/login.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			String email = req.getParameter("txtemail");
			String password = req.getParameter("txtpassword");
			AccountModel accountModel = accountService.findByUsernameAndPassword(email, password);
			if(accountModel!=null) {
				SessionUtil.getInstance().putValue(req, "acc", accountModel);
				resp.sendRedirect(req.getContextPath()+"/home");
			}
			else
			{
//				req.setAttribute("anounc","alert alert-danger");
//				req.setAttribute("mess", "Sai email hoặc mật khẩu, vui lòng thử lại");
//				req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
				resp.sendRedirect(req.getContextPath()+"/login?mess=username_password_invalid");
			}
		    
	}
}
