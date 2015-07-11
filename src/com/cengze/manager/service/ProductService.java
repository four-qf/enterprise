package com.cengze.manager.service;

import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.Product;
import com.cengze.entity.ProductKind;
import com.cengze.manager.dao.ProductDao;

@Service
@Transactional(readOnly = true, noRollbackFor = {Exception.class})
public class ProductService {

	@Resource
	private ProductDao productDao;
	
	public Collection<ProductKind> getProductKinds() {
		return productDao.getProductKinds();
	}

	@Transactional
	public void saveOrUpdate(Product product) {
		productDao.saveOrUpdate(product);
	}

	public List<Product> getProductList() {
		return productDao.getProductList();
		
	}

	@Transactional
	public void delete(String productid) {
		productDao.delete(productid);
	}

	public List<Product> getProductList(Integer productkindid) {
		return productDao.getProductList(productkindid);
	}
	
	@Transactional
	public void saveProductKind(String productkindname) {
		productDao.saveProductKind(productkindname);
	}

	public Product getProductById(Integer productid) {
		return productDao.getProductById(productid);
	}

}
