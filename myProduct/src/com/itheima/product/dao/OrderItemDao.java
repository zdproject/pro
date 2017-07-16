package com.itheima.product.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.itheima.product.domain.OrderItem;
import com.itheima.product.util.C3P0Util;
import com.itheima.product.util.ManagerThreadLocal;

public class OrderItemDao {
	//Ìí¼Ó¶©µ¥Ïî
	public void addOrderItem(List<OrderItem> list) throws SQLException{
		QueryRunner qr = new QueryRunner();
		String sql = "insert into orderitem values(?,?,?)";
		Object[][] params = new Object[list.size()][];
		for (int i = 0; i < params.length; i++) {
			
			params[i] = new Object[]{ list.get(i).getOrder().getId(),
									  list.get(i).getProduct().getId(),
									  list.get(i).getBuynum() };
		}
		
		qr.batch(ManagerThreadLocal.getConnection(),sql, params);
	}
}
