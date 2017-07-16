package com.itheima.product.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.itheima.product.util.C3P0Util;
import com.itheima.product.util.ManagerThreadLocal;
import com.itheima.product.domain.Order;
import com.itheima.product.domain.OrderItem;
import com.itheima.product.domain.Product;
import com.itheima.product.domain.User;

public class OrderDao {
	
	public void addOrder(Order order) throws SQLException {
		//��Ӷ���
		QueryRunner qr = new QueryRunner();
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		qr.update(ManagerThreadLocal.getConnection(), sql , order.getId(),order.getMoney(),order.getReceiverAddress(), 
				order.getReceiverName(),order.getReceiverPhone(),order.getPaystate(),
				order.getOrdertime(),order.getUser().getId());
	}

	public List<Order> findOrderByUserId(String id) throws SQLException {
		//�����û�id��ѯ�û�����
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from orders where user_id=?";
		return qr.query(sql,new BeanListHandler<Order>(Order.class), id);
	}

	public List<OrderItem> findOrderItemsByOrderId(String orderid) throws SQLException {
		//��ѯ�û�ĳ�������Ķ�������
		
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from orderitem o,products p where order_id=? and o.product_id=p.id ";
		List<OrderItem> orderitems = qr.query(sql, new ResultSetHandler<List<OrderItem>>(){
					//��дһ����װ����
					public List<OrderItem> handle(ResultSet rs) throws SQLException{
						
						List<OrderItem> orderitems = new ArrayList<OrderItem>();
						while(rs.next()){
							//��װOrderItem����
							OrderItem oi = new OrderItem();
							oi.setBuynum(rs.getInt("buynum"));
							//��װProduct����
							Product p = new Product();
							p.setName(rs.getString("name"));
							p.setPrice(rs.getDouble("price"));
							//��Product�����װ��OrderItem����
							oi.setProduct(p);
							
							orderitems.add(oi);
						}
						return orderitems;
						
					}
		}, orderid);
		return orderitems;
		
	}
}
