package com.cengze.web.dao;

import java.util.List;

import com.cengze.entity.Product;
import com.cengze.entity.ProductKind;

public interface WebProductDao {

	List<Product> getProductList();

	List<ProductKind> getProductKinds();

	List<Product> getProductListById(Integer productkindid);

	Product getProductById(Integer productid);

}
