package com.itheima.product.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.itheima.product.dao.OrderDao;
import com.itheima.product.dao.OrderItemDao;
import com.itheima.product.dao.ProductDao;
import com.itheima.product.domain.Order;
import com.itheima.product.domain.OrderItem;
import com.itheima.product.domain.Product;
import com.itheima.product.util.ManagerThreadLocal;

public class OrderService {
	OrderDao od = new OrderDao();
	OrderItemDao oid = new OrderItemDao();
	ProductDao pd = new ProductDao();
	
	public void addOrder(Order order, List<OrderItem> list) {
		
		try {
			ManagerThreadLocal.startTransacation();
				od.addOrder(order);
				oid.addOrderItem(list);
				pd.updateProduct(list);
			ManagerThreadLocal.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ManagerThreadLocal.rollback();
		}
		
	}

	public List<Order> findOrderByUserId(String id)  {
		try {
			return od.findOrderByUserId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<OrderItem> findOrderItemsByOrderId(String orderid) {
		try {
			return od.findOrderItemsByOrderId(orderid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
