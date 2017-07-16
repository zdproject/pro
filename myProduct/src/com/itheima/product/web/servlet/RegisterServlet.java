package com.itheima.product.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.itheima.product.domain.User;
import com.itheima.product.exception.UserException;
import com.itheima.product.service.UserService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//������֤��
		String ckcode = request.getParameter("ckcode");
		String checkcode = (String) request.getSession().getAttribute("checkcode_session");
		if( !ckcode.equals(checkcode) ){
			request.setAttribute("ckcode_msg", "��֤�����");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return; //�����return�������ִ��-----------------------------------------------------------ע�⣡
		}
		//��ȡ��
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());  //BeanUtils������ֱ�ӷ�װ��User
			user.setActiveCode(UUID.randomUUID().toString());//�ֶ����ü�����
			//����ҵ���߼�
			UserService us = new UserService();
			us.regist( user );
			request.getRequestDispatcher("/registersuccess.jsp").forward(request, response);
		} catch(UserException e){
			request.setAttribute("user_msg", e.getMessage());
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		catch (Exception e) {
			e.printStackTrace();
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
