package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AccountModel;
import utils.SessionUtil;

@WebFilter(urlPatterns = {"/admin_manager_order","/addProduct","/admin_manage_product"})
public class AdministratorsFilter implements Filter{

	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request2 = (HttpServletRequest) request;
		HttpServletResponse response2 = (HttpServletResponse) response;
		String url = request2.getRequestURI();
		if(url.contains("/admin_manager_order") || url.contains("/addProduct") || url.contains("/admin_manage_product")) {
			AccountModel accountModel = (AccountModel)SessionUtil.getInstance().getValue(request2, "acc");
			if(accountModel!=null) {
				if(accountModel.getUser().getRolemodel().getRoleId()==1){
					chain.doFilter(request2, response2);
				}
				else {
					response2.sendRedirect(request2.getContextPath()+"/login?mess=admin_required");
				}
			}
			else {
				response2.sendRedirect(request2.getContextPath()+"/login?mess=login_required");
			}
		}
		else {
			chain.doFilter(request2, response2);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
