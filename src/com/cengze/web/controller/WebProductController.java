package com.cengze.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cengze.entity.Product;
import com.cengze.util.PageUtil;
import com.cengze.util.auth.AuthPassport;
import com.cengze.web.service.WebProductService;

@Controller
@RequestMapping("/web/product")
public class WebProductController {
	
	@Resource
	private WebProductService webProductService;
	
	@AuthPassport
	@RequestMapping(value="/list" , method = RequestMethod.GET)
	public String list(HttpSession session) {
		List<Product> list = webProductService.getProductList();
		PageUtil pageUtil = new PageUtil();
		pageUtil.getPageCount(list, session);
		session.setAttribute("productlist", list);
		return "/web/product/list";
	}
	
	@AuthPassport
	@RequestMapping(value="/list/{productkindid}", method = RequestMethod.GET)
	public String list(HttpSession session, @PathVariable Integer productkindid) {
		List<Product> list = webProductService.getProductListByKind(productkindid);
		PageUtil pageUtil = new PageUtil();
		pageUtil.getPageCount(list, session);
		session.setAttribute("productlist", list);
		return "/web/product/list";
	}
	
	@RequestMapping(value="/getPageNow/{pageNow}", method=RequestMethod.GET)
	public String getPageNow(HttpSession session, @PathVariable Integer pageNow) {
		session.setAttribute("pageNow", pageNow);
		return "/web/product/list";
	}
	
	@AuthPassport
	@RequestMapping(value="/showproduct/{productid}", method = RequestMethod.GET)
	public String showProduct(@PathVariable Integer productid, Map<String, Object> map) {
		Product product = webProductService.getProductById(productid);
		map.put("product", product);
		return "/web/product/show";
	}
}
