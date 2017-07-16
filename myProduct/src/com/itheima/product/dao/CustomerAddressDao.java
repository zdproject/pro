package com.itheima.product.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.itheima.product.domain.CustomerAddress;
import com.itheima.product.util.C3P0Util;

public class CustomerAddressDao {

	public List<CustomerAddress> findCustomerInfoById(int id) throws SQLException {
		//�����û�id�ҵ��û����õ��ջ���Ϣ
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from address where user_id=?";
		return qr.query(sql, new BeanListHandler<CustomerAddress>(CustomerAddress.class),id);
	}
}
