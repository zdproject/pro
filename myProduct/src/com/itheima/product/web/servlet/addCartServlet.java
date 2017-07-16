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
		// ��sessionʵ�ֹ��ﳵ
		HttpSession session = request.getSession();
		//���ж�session��û���û���Ϣ
		User user = new User();
		user = (User) session.getAttribute("user");
		if(user==null){
			//���û�û��¼����ת����¼ҳ��
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
		String id = request.getParameter("id");
		ProductService ps = new ProductService();
		Product product = ps.findProductById(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		Map<Product,String> cart = (Map<Product,String>)session.getAttribute("cart"); //��Map�洢��Ʒ��������
		
		int num=1;
		
		if(cart==null){
			//����ǵ�һ�η��ʣ�û�й��ﳵ�������Ǿʹ��� һ�����ﳵ����
			cart = new HashMap<Product,String>();	//Map�Ǹ��ӿڣ���������ʵ����HashMap
		}
		
		if(cart.containsKey(product)){
			//�鿴��ǰ�������Ƿ����b�Ȿ��,����оͰ�����ȡ������1;
			num = Integer.parseInt(cart.get(product))+1;
		}
		
		cart.put(product, num+"");//��ͼ����빺�ﳵ
		
		request.getSession().setAttribute("cart", cart);//��cart����Żص�session��������
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
