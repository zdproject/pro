package com.itheima.product.service;

import java.sql.SQLException;
import java.util.List;

import com.itheima.product.domain.PageBean;
import com.itheima.product.domain.Product;
import com.itheima.product.dao.ProductDao;

public class ProductService {

	ProductDao pd = new ProductDao();
	
	public PageBean findProduct(String category, int pageSize, int firstPage) {
		
		try {
			int count = pd.count(category); //得到数量
			int totalPage = (int) Math.ceil(count*1.0/pageSize); //总页数
			List<Product> products = pd.findProducts(firstPage, pageSize, category);
			
			PageBean pb = new PageBean();
			pb.setCount(count);
			pb.setTotalPage(totalPage);
			pb.setProducts(products);
			pb.setCategory(category);
			pb.setCurrentPage(firstPage);
			pb.setPageSize(pageSize);
			return pb;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

	public Product findProductById(String id) {
		try {
			return pd.findProductById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Object> findProductByName(String name) {
		try {
			return pd.findProductByName(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
