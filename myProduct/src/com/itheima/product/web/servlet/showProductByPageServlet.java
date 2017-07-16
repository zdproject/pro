package com.itheima.product.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.product.domain.PageBean;
import com.itheima.product.service.ProductService;

/**
 * Servlet implementation class showProductByPageServlet
 */
@WebServlet("/showProductByPageServlet")
public class showProductByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showProductByPageServlet() {
        super();
     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = (String) request.getParameter("category"); //�õ���Ŀ
		if( category==null ){
			category ="";
		}
		int pageSize = 4; //��ʼ��ÿҳ��ʾ������
		
		int firstPage = 1; //��һҳ
		String currentPage = request.getParameter("currentPage"); //�õ��������ҳ��
		if(currentPage!=null && !"".equals(currentPage)){ //ҳ������Ϊ��
			firstPage = Integer.parseInt(currentPage);
		}
		
		ProductService ps = new ProductService();
		PageBean pb = ps.findProduct(category,pageSize,firstPage);
		
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/product_list.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
