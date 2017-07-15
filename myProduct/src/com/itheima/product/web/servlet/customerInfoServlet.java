package com.itheima.product.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.product.domain.CustomerAddress;
import com.itheima.product.domain.User;
import com.itheima.product.service.CustomerAddressService;
import com.itheima.product.service.UserService;

/**
 * Servlet implementation class customerInfoServlet
 */
@WebServlet("/customerInfoServlet")
public class customerInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 得到session中用户id
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
			int id = user.getId();
			//去address表查询此id用户的收货信息
			CustomerAddressService us = new CustomerAddressService();
			List<CustomerAddress> list = us.findCustomerInfo(id); 
			if( list==null || list.isEmpty() ){
				response.sendRedirect(request.getContextPath()+"/order.jsp");
			}else{
				CustomerAddress customerInfo = list.get(0);
				request.setAttribute("customerInfo", customerInfo);
				request.getRequestDispatcher("/order.jsp").forward(request, response);
			}
		}else{
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
