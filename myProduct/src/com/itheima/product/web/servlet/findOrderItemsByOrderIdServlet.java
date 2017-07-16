package com.itheima.product.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.product.domain.OrderItem;
import com.itheima.product.domain.Product;
import com.itheima.product.service.OrderService;

/**
 * Servlet implementation class findOrderItemsByOrderIdServlet
 */
@WebServlet("/findOrderItemsByOrderIdServlet")
public class findOrderItemsByOrderIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findOrderItemsByOrderIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String orderid = request.getParameter("orderid");
		OrderService os = new OrderService();
		List<OrderItem> list = os.findOrderItemsByOrderId(orderid);
		request.setAttribute("productsInfo", list);
		request.getRequestDispatcher("/orderInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
