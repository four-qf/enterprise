package com.cengze.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.Product;
import com.cengze.entity.ProductKind;
import com.cengze.web.dao.WebProductDao;

@Service
@Transactional(readOnly = true, noRollbackFor = {Exception.class})
public class WebProductService {

	@Resource
	private WebProductDao webProductDao;
	
	public List<Product> getProductList() {
		return webProductDao.getProductList();
	}

	public List<ProductKind> getProductKinds() {
		return webProductDao.getProductKinds();
	}

	public List<Product> getProductListByKind(Integer productkindid) {
		return webProductDao.getProductListById(productkindid);
	}

	public Product getProductById(Integer productid) {
		return webProductDao.getProductById(productid);
	}


	
	
}
