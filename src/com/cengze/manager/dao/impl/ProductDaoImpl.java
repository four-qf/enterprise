package com.cengze.manager.dao.impl;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.Product;
import com.cengze.entity.ProductKind;
import com.cengze.manager.dao.ProductDao;

@Repository
public class ProductDaoImpl extends DaoBase implements ProductDao {

	@SuppressWarnings("unchecked")
	@Override
	public Collection<ProductKind> getProductKinds() {
		return getSession().createQuery("From ProductKind").list();
	}

	@Override
	public void saveOrUpdate(Product product) {
		product.setMarkettime(new Timestamp(new Date().getTime()));
		getSession().saveOrUpdate(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductList() {
		String hql = "From Product p order by p.markettime desc ";
		return getSession().createQuery(hql).list();
	}

	@Override
	public void delete(String productid) {
		String hql = "DELETE FROM Product where productid in ( " + productid + " )";
		getSession().createQuery(hql).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductList(Integer productkindid) {
		String hql = "From Product where productkindid = ? order by markettime desc ";
		return getSession().createQuery(hql).setInteger(0, productkindid).list();
	}

	@Override
	//添加产品类别
	public void saveProductKind(String productkindname) {
		ProductKind productkind = new ProductKind();
		productkind.setProductkindname(productkindname);
		getSession().save(productkind);
	}

	@Override
	public Product getProductById(Integer productid) {
		String hql = "From Product p where p.productid = ?  ";
		return (Product) getSession().createQuery(hql).setInteger(0, productid).uniqueResult();
	}

}
