package com.itheima.product.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itheima.product.domain.Product;

/**
 * Servlet implementation class changeNumServlet
 */
@WebServlet("/changeNumServlet")
public class changeNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeNumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Map<Product,String> cart = (Map<Product, String>) session.getAttribute("cart");
		String id = (String) request.getParameter("id");
		String num = (String) request.getParameter("num");
		Product b = new Product();
		b.setId(id);
		
		//如果商品数据为0，就删除对象
		if("0".equals(num)){
			cart.remove(b);
		}
		//判断如果找到与id相同的书（Product中已经重写了hashcode()方法，与id相关）
		if(cart.containsKey(b)){
			cart.put(b, num);
		}		
		
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
