package com.itheima.product.dao;

import java.awt.print.Book;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.itheima.product.domain.OrderItem;
import com.itheima.product.domain.Product;
import com.itheima.product.util.C3P0Util;
import com.itheima.product.util.ManagerThreadLocal;


public class ProductDao {
	
	/**
	 * ��������ͼ��
	 * @return
	 * @throws SQLException
	 */
	public List<Product> findAllBooks() throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products", new BeanListHandler<Product>(Product.class));
	}
	/**
	 * ���ͼ����Ϣ
	 * @param product
	 * @throws SQLException
	 */
	public void addBook(Product product) throws SQLException{
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("INSERT INTO products VALUES(?,?,?,?,?,?,?)",product.getId(),product.getName(),product.getPrice(),product.getPnum(),product.getCategory(),product.getDescription(),product.getImgurl());
	}
	
	
	/**
	 * �޸�ͼ����Ϣ
	 * @param product
	 * @throws SQLException
	 */
	public void updateBook(Product product) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("update products set name=?,price=?,pnum=?,category=?,description=? where id=?",
				product.getName(),product.getPrice(),product.getPnum(),product.getCategory(),product.getDescription(),product.getId());

	}
	/**
	 * ����idɾ��ͼ��
	 * @param id
	 * @throws SQLException 
	 */
	public void delBook(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("delete from products where id=?",id);
	}
	
	/**
	 * ����ɾ��
	 * @param ids
	 * @throws SQLException 
	 */
	public void deleAllBooks(String[] ids) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		Object[][] params = new Object[ids.length][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[]{ids[i]};//ѭ����ÿ��һά�����е�Ԫ�ظ�ֵ��ֵ��id
		}
		qr.batch("delete from products where id=?", params );
	}
	
	/**
	 * ��������ѯͼ��
	 * @param id
	 * @param category
	 * @param name
	 * @param minprice
	 * @param maxprice
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> searchBooks(String id, String category, String name,
			String minprice, String maxprice) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from products where 1=1";
		List list = new ArrayList();
		if(!"".equals(id.trim())){
			sql+=" and id like ?"; //  ��������д%   %'1002'%
			list.add("%"+id.trim()+"%");// '%1002%'
		}
		
		if(!"".equals(category.trim())){
			sql+=" and category=?";
			list.add(category.trim());
		}
		
		if(!"".equals(name.trim())){
			sql+=" and name like ?";
			list.add("%"+name.trim()+"%");
		}
		
		if(!"".equals(minprice.trim())){
			sql+=" and price>?";
			list.add(minprice.trim());
		}
		if(!"".equals(maxprice.trim())){
			sql+=" and price< ?";
			list.add(maxprice.trim());
		}
		
		return qr.query(sql, new BeanListHandler<Product>(Product.class),list.toArray());
	}
	
	/**
	 * �õ��ܼ�¼��
	 * @return
	 * @throws SQLException
	 */

	
	/**
	 * ������������ͼ�� ģ����ѯ
	 * @param name
	 * @return
	 * @throws SQLException
	 */
	public List<Object> searchBookByName(String name) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select name from products where name like ?", new ColumnListHandler(),"%"+name+"%");
	}
	
	public int count(String category) throws SQLException {
		//�õ��ܼ�¼��
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql ="select count(*) from products";
		//���category���ǿգ��Ͱ���������
		if(!"".equals(category)){
			sql+=" where category='"+category+"'";
		}
		long l =  (Long)qr.query(sql, new ScalarHandler(1));
		return (int)l;
	}
	
	
	public List<Product> findProducts(int currentPage, int pageSize,String category) throws SQLException {
		//���ҷ�ҳ����
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from products where 1=1";
		List list = new ArrayList();
		if(!"".equals(category)){
			sql+=" and category=?";
			list.add(category);
		}
		sql+=" limit ?,?";
		
		list.add((currentPage-1)*pageSize);
		list.add(pageSize);

		return qr.query(sql, new BeanListHandler<Product>(Product.class),list.toArray());
	}
	
	public Product findProductById(String id) throws SQLException {
		//������Ʒid��ѯ��Ʒ
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from products where id=?",new BeanHandler<Product>(Product.class),id);
	}
	
	public List<Object> findProductByName(String name) throws SQLException {
		//������Ʒ����ģ����ѯ��Ʒ
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select name from products where name like ?",new ColumnListHandler(),"%"+name+"%");
	}
	
	public void updateProduct(List<OrderItem> list) throws SQLException {
		//���ݶ�������¿��
		QueryRunner qr = new QueryRunner( );
		String sql = "update products set pnum=pnum-? where id=?";
		Object[][] params = new Object[list.size()][];
		for (int j = 0; j < params.length; j++) {
			params[j] = new Object[]{list.get(j).getBuynum() , 
									list.get(j).getProduct().getId()};
		}
		
		qr.batch(ManagerThreadLocal.getConnection(),sql, params);
	}
}




