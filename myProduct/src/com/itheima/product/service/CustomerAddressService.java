package com.itheima.product.service;

import java.sql.SQLException;
import java.util.List;

import com.itheima.product.dao.CustomerAddressDao;
import com.itheima.product.domain.CustomerAddress;

public class CustomerAddressService {
	CustomerAddressDao cad = new CustomerAddressDao();
	
	public List<CustomerAddress> findCustomerInfo(int id) {
		try {
			return cad.findCustomerInfoById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
