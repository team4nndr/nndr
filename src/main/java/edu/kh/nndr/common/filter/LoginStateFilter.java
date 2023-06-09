package edu.kh.nndr.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 로그인 상태이면 로그인 화면 접근 불가
@WebFilter (filterName = "loginStateFilter", urlPatterns = "/")
public class LoginStateFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();

		if(session.getAttribute("loginMember") != null) {
			resp.sendRedirect("/mainFeed");
		} else {
			chain.doFilter(request, response);
		}
	}
}
