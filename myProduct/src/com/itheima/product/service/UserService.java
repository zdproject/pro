package com.itheima.product.service;

import java.sql.SQLException;
import java.util.List;

import com.itheima.product.dao.UserDao;
import com.itheima.product.domain.CustomerAddress;
import com.itheima.product.domain.User;
import com.itheima.product.exception.UserException;
import com.itheima.product.util.SendJMail;

public class UserService {
	
	UserDao ud = new UserDao();
	
	public void regist(User user) throws UserException{
		
		try {
			ud.addUser(user);
			String emailMsg = "ע��ɹ�����������<a href='59.110.235.46/myProduct?activeCode="+user.getActiveCode()+"'>http://59.110.235.46/myProduct/ActiveServlet?activeCode="+user.getActiveCode()+"</a>������¼";
			SendJMail.sendMail(user.getEmail(),emailMsg);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("ע��ʧ�ܣ�");
		}
		
	}

	public void activeUser(String activeCode) throws UserException {
		// ���ݼ���������û������ҵ��򼤻�
		User user;
		try {
			user = ud.findUserByActiveCode(activeCode);
			if (user!=null){
				ud.activeCode(activeCode);//�����û�״̬
				return;
			}
			throw new UserException("����ʧ�ܣ�");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("����ʧ�ܣ�");
		}

	}

	public User login(String username, String password) throws UserException {
		User user;
		try {
			user = ud.findUserByUserameAndPassword( username,password );
			if( user==null ){
				throw new UserException("�û������������");
			}
			if( user.getState()==0 ){
				throw new UserException("����˺Ż�û�����ǰ�����伤�");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("��¼ʧ�ܣ�");
		}
		return user;
	}

	public User findUserById(String id) throws UserException {
		
		try {
			return ud.findUserById( id );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("�û�����ʧ�ܣ�");
		}
	}

	public void modifyUser(User user) throws UserException {
		// TODO Auto-generated method stub
		try {
			ud.modifyUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("�޸�ʧ�ܣ�");
		}
	}

	public User findUserByEmail(String email) throws SQLException {
		return ud.findUserByEmail(email);
	}

}
