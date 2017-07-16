package com.itheima.product.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.product.service.ProductService;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class findProductNameServlet
 */
@WebServlet("/findProductNameServlet")
public class findProductNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findProductNameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");  //ֻ�ܽ��POST��ʽ������
			response.setContentType("text/html;charset=UTF-8");
			String name = request.getParameter("name");
			ProductService ps = new ProductService();
			
			List<Object> list = ps.findProductByName(name);
			
			//String str ="[";              //����2
			//StringBuilder str = new StringBuilder();//����1
			
			//���ﻹҪ�����Ƿ������ͬ����Ʒ���ƣ�ռ�ӣ��Ժ�ȥ�ء�
			if(list!=null){
				
				/*for( int i=0;i<list.size();i++ ){//����1
					if( i>0 ){
						str.append(",");
					}
					str.append(list.get(i)+"");
				}
				String string = str.toString();*/
				
				/*
				for( int i=0;i<list.size();i++ ){//����2
					if( i>0 ){
						str+=",";
					}
					str+="\""+list.get(i)+"\"";
				}
				str+="]";*/
				
				String str = JSONArray.fromObject(list).toString();
			
				/*������ajax�����Բ���ô��
				request.setAttribute("string", string);
				request.getRequestDispatcher("/index.jsp").forward(request, response);*/

				response.getWriter().write(str); //������ֱ����Ӧ���ͻ���
				
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
