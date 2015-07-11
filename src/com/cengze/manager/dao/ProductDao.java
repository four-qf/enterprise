package com.cengze.manager.dao;

import java.util.Collection;
import java.util.List;

import com.cengze.entity.Product;
import com.cengze.entity.ProductKind;

public interface ProductDao {

	Collection<ProductKind> getProductKinds();

	void saveOrUpdate(Product product);

	List<Product> getProductList();

	void delete(String productid);

	List<Product> getProductList(Integer productkindid);

	void saveProductKind(String productkindname);

	Product getProductById(Integer productid);

}
