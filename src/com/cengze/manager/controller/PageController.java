package com.cengze.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager")
public class PageController {
	
	@RequestMapping(value="/header", method=RequestMethod.GET)
	public String head(){
		return "/manage/header";
	}
	
	@RequestMapping(value="/menu", method=RequestMethod.GET)
	public String menu(){
		return "/manage/menu";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(){
		return "/manage/main";
	}
   
}
