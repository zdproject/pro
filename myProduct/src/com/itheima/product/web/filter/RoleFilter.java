package com.itheima.product.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.product.domain.User;

public class RoleFilter implements Filter{

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//ǿת
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		//����ҵ��
			//��session���û�����õ�
			User user = (User) request.getSession().getAttribute("user");
			if(user==null || !"����Ա".equals(user.getRole())){
				response.getWriter().write("Ȩ�޲��㣡");
				response.setHeader("refresh", "2,url="+request.getContextPath()+"/index.jsp");
				return;
			}
		//����
			chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
