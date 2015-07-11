package com.cengze.web.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cengze.entity.Manager;
import com.cengze.entity.User;
import com.cengze.web.service.WebUserService;
import com.cengze.web.service.WebNewsService;
import com.cengze.web.service.WebProductService;


@Controller
public class IndexController {
	
	@Resource
	private WebNewsService webNewsService ;
	@Resource
	private WebProductService webProductService;
	@Resource
	private WebUserService webUserService;
	
	@RequestMapping(value="/", method= RequestMethod.GET)
	public String  toIndex(HttpSession session) {
		session.setAttribute("newslist", webNewsService.getNewsList());
		session.setAttribute("productlist", webProductService.getProductList());
		session.setAttribute("productkinds", webProductService.getProductKinds());
		session.setAttribute("newskinds", webNewsService.getNewsKinds());
		return "/web/index" ;
	}
	
	@RequestMapping(value="/web/companyBrief", method=RequestMethod.GET)
	public String companyBrief() {
		return "/web/company/about";
	}
	
	@RequestMapping(value="/web/contact", method = RequestMethod.GET)
	public String contact() {
		return "/web/company/contact" ;
	}
	
	@RequestMapping(value="/web/login", method = RequestMethod.GET)
	public String toLogin() {
		return "/web/login";
	}
	
	
	
	//用户注册
	@RequestMapping(value="/web/regist", method=RequestMethod.GET)
	public String toregister() {
		return "/web/regist";
	}
	
}
