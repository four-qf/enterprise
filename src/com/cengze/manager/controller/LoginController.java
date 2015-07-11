package com.cengze.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cengze.entity.Manager;
import com.cengze.manager.service.LoginService;
import com.cengze.manager.service.NewsService;
import com.cengze.util.MD5Util;
import com.cengze.util.auth.AuthPassport;

@Controller
@RequestMapping("/manager")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String toLogin() {
		return "/manage/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@Validated Manager manager, @RequestParam String checkcode, HttpServletRequest request) {
		String code = (String) request.getSession().getAttribute("code");
		if(code.equalsIgnoreCase(checkcode)){
			String password = manager.getPassword();
			if(!(password.equals("123456"))){
				MD5Util md5Util = new MD5Util();
				password = md5Util.MD5(password);
				manager.setPassword(password);
			}
			Manager man = loginService.checkValiable(manager);
            if(man == null){
            	request.setAttribute("error", "密码或账户错误");
            	return "/manage/login";
            }else{
                request.getSession().setAttribute("man", man);
                request.getSession().setAttribute("newskinds", newsService.getNewsKinds());
            	return "/manage/manager";
            }		
			
		}else {
			request.setAttribute("error", "验证码输入错误");
			return "/manage/login";
		}
		
	}
	
	@RequestMapping(value="/exit", method=RequestMethod.GET)
	public String exitLogin(HttpSession session) {
		session.invalidate();
		return "/manage/login";
	}
	
}
