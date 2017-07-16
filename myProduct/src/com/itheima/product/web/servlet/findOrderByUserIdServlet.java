package com.itheima.product.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.product.domain.Order;
import com.itheima.product.domain.User;
import com.itheima.product.service.OrderService;

/**
 * Servlet implementation class findOrderByUserIdServlet
 */
@WebServlet("/findOrderByUserIdServlet")
public class findOrderByUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findOrderByUserIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获得session中的用户id
		User my = (User) request.getSession().getAttribute("user");
		String id = my.getId()+"";
		if( id!=null && !"".equals(id)){
			OrderService os =new OrderService();
			List<Order> list = os.findOrderByUserId(id);
			
			request.setAttribute("orders", list);
			request.getRequestDispatcher("/orderlist.jsp").forward(request, response);
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
