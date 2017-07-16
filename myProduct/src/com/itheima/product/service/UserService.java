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
			String emailMsg = "注册成功，请点击链接<a href='http://www.product.com?activeCode="+user.getActiveCode()+"'>http://localhost:8080/myProduct/ActiveServlet?activeCode="+user.getActiveCode()+"</a>激活后登录";
			SendJMail.sendMail(user.getEmail(),emailMsg);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("注册失败！");
		}
		
	}

	public void activeUser(String activeCode) throws UserException {
		// 根据激活码查找用户，查找到则激活
		User user;
		try {
			user = ud.findUserByActiveCode(activeCode);
			if (user!=null){
				ud.activeCode(activeCode);//激活用户状态
				return;
			}
			throw new UserException("激活失败！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("激活失败！");
		}

	}

	public User login(String username, String password) throws UserException {
		User user;
		try {
			user = ud.findUserByUserameAndPassword( username,password );
			if( user==null ){
				throw new UserException("用户名或密码错误！");
			}
			if( user.getState()==0 ){
				throw new UserException("你的账号还没激活，请前往邮箱激活！");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("登录失败！");
		}
		return user;
	}

	public User findUserById(String id) throws UserException {
		
		try {
			return ud.findUserById( id );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("用户查找失败！");
		}
	}

	public void modifyUser(User user) throws UserException {
		// TODO Auto-generated method stub
		try {
			ud.modifyUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UserException("修改失败！");
		}
	}

	public User findUserByEmail(String email) throws SQLException {
		return ud.findUserByEmail(email);
	}

}
