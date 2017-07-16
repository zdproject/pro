package com.itheima.product.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.itheima.product.domain.CustomerAddress;
import com.itheima.product.domain.User;
import com.itheima.product.util.C3P0Util;

public class UserDao {

	public void addUser(User user) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "insert into user (username,PASSWORD,gender,email,telephone,introduce,activeCode,state,registTime) "
				+ "values (?,?,?,?,?,?,?,?,?)";
			qr.update(sql, user.getUsername(),user.getPASSWORD(),
					user.getGender(),user.getEmail(),user.getTelephone(),
					user.getIntroduce(),user.getActiveCode(),user.getState(),user.getRegistTime());
	}

	public User findUserByActiveCode(String activeCode) throws SQLException {
		// ���ݼ���������û�
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from user where activeCode=?";
		return qr.query(sql, new BeanHandler<User>(User.class),activeCode);
	}
	
	public void activeCode(String activeCode) throws SQLException{
		//�����û�״̬
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update user set state=1 where activeCode=?",activeCode);
	}

	public User findUserByUserameAndPassword(String username, String password) throws SQLException {
		//�����û�������������û�
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from user where username=? and PASSWORD=? ";
		return qr.query(sql, new BeanHandler<User>(User.class),username,password);
	}

	public User findUserById(String id) throws SQLException {
		//����id�����û�
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from user where id=?";
		return qr.query(sql, new BeanHandler<User>(User.class),id);
	}

	public void modifyUser(User user) throws SQLException {
		//�޸��û���Ϣ
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "update user set PASSWORD=?,gender=?,telephone=? where id=?";
		qr.update(sql,user.getPASSWORD(),user.getGender(),user.getTelephone(),user.getId());
	}

	public User findUserByEmail(String email) throws SQLException {
		//��ѯ�����Ƿ����
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from user where email=?";
		return qr.query(sql, new BeanHandler<User>(User.class),email);
	}

	
}
