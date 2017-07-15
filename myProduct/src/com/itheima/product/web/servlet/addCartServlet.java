package com.itheima.product.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.itheima.product.domain.Product;
import com.itheima.product.domain.User;
import com.itheima.product.service.ProductService;

/**
 * Servlet implementation class addCartServlet
 */
@WebServlet("/addCartServlet")
public class addCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 用session实现购物车
		HttpSession session = request.getSession();
		//先判断session有没有用户信息
		User user = new User();
		user = (User) session.getAttribute("user");
		if(user==null){
			//若用户没登录则跳转到登录页面
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
		String id = request.getParameter("id");
		ProductService ps = new ProductService();
		Product product = ps.findProductById(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		Map<Product,String> cart = (Map<Product,String>)session.getAttribute("cart"); //用Map存储产品及其数量
		
		int num=1;
		
		if(cart==null){
			//如果是第一次访问，没有购物车对象，我们就创建 一个购物车对象
			cart = new HashMap<Product,String>();	//Map是个接口，所以用其实现类HashMap
		}
		
		if(cart.containsKey(product)){
			//查看当前集合中是否存在b这本书,如果有就把数据取出来加1;
			num = Integer.parseInt(cart.get(product))+1;
		}
		
		cart.put(product, num+"");//把图书放入购物车
		
		request.getSession().setAttribute("cart", cart);//把cart对象放回到session作用域中
		response.sendRedirect(request.getContextPath()+"/cartRedirect.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
