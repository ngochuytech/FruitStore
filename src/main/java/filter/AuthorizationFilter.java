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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AccountModel;
import utils.SessionUtil;

@WebFilter(urlPatterns = {"/checkout","/user_information"})
public class AuthorizationFilter implements Filter{

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
		if(url.contains("/checkout") || url.contains("/user_information")) {
			AccountModel accountModel = (AccountModel)SessionUtil.getInstance().getValue(request2, "acc");
			if(accountModel!=null) {
				chain.doFilter(request2, response2);
			}
			else {
				response2.sendRedirect(request2.getContextPath()+"/login?mess=login_required");
			}
		} else {
			chain.doFilter(request2, response2);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
