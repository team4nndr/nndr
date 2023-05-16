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

import edu.kh.nndr.member.model.dto.Member;

@WebFilter (filterName = "loginFilter", urlPatterns = "/admin/*")
public class AdminFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		
		// 관리자가 아니면 메인페이지로 
		Member loginMember = (Member)session.getAttribute("loginMember");
		if( loginMember == null || !loginMember.getMemberCode().equals("A")) { 
			resp.sendRedirect("/");
		} else {
			chain.doFilter(request, response);
		}
	}
}
