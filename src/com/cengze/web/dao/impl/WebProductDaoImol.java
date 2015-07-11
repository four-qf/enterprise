package com.cengze.web.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.Product;
import com.cengze.entity.ProductKind;
import com.cengze.web.dao.WebProductDao;

@Repository
public class WebProductDaoImol extends DaoBase implements WebProductDao {

	@SuppressWarnings("unchecked")
	public List<Product> getProductList() {
		String hql = "From Product p order by p.markettime desc" ;
		return getSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	public List<ProductKind> getProductKinds() {
		return getSession().createQuery("From ProductKind").list();
	}

	@Override
	public List<Product> getProductListById(Integer productkindid) {
		String hql = "From Product p where productkindid = ? order by p.markettime desc";
		return getSession().createQuery(hql).setInteger(0, productkindid).list();
	}

	@Override
	public Product getProductById(Integer productid) {
		String hql = "From Product p where p.productid = ?";
		return (Product) getSession().createQuery(hql).setInteger(0, productid).uniqueResult();
	}

}
