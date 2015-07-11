 package com.cengze.manager.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cengze.entity.Manager;
import com.cengze.manager.service.ManagerService;
import com.cengze.util.MD5Util;
import com.cengze.util.PageUtil;
import com.cengze.util.auth.AuthPassport;

 @Controller
 @RequestMapping("/manager")
public class ManagerController {
	 
	 @Resource
	 private ManagerService managerService;
	 
	 @ModelAttribute
	 public void getManager(@RequestParam(value="managerid", required=false) Integer managerid,
			           Map<String, Object> map) {
		 if(managerid != null) {
			 map.put("manager", managerService.getManagerById(managerid));
		 }
	 }
	 
	 @AuthPassport
	 @RequestMapping(value="/managerlist", method=RequestMethod.GET)
	 public String list(HttpSession session) {
		
		 List  managelist = managerService.list();
		 PageUtil pageUtil = new PageUtil();
		 pageUtil.getPageCount(managelist, session);
	     session.setAttribute("managers", managelist);
		 return "/manage/manager/managerlist";
	 }
	
	 @RequestMapping(value="/getPageNow/{pageNow}",method=RequestMethod.GET)
	 public String getPageNow(@PathVariable int pageNow, HttpSession session) {
		 session.setAttribute("pageNow", pageNow);
		 return "/manage/manager/managerlist";
	 }
	 
	 @RequestMapping(value="/getPageNow",method=RequestMethod.POST)
	 public String pageNow(@Param Integer pageNow, HttpSession session) {
		 session.setAttribute("pageNow", pageNow);
		 return "/manage/manager/managerlist";
	 }
	 
	 @RequestMapping(value="/delete", method=RequestMethod.POST)
	 public String delete(@Param String managerid) {
		 managerService.delete(managerid);
		 return "redirect:/manager/managerlist";
	 }
	 
	 @RequestMapping(value="/input/{managerid}", method=RequestMethod.GET)
	 public String update(Map<String, Object> map, @PathVariable Integer managerid) {
		 map.put("manager", managerService.getManagerById(managerid) );
		 map.put("departments", managerService.getDepartments());
		 return "/manage/manager/input";
	 }
	 
 	 @RequestMapping(value="/saveOrUpdate",method=RequestMethod.POST)
	 public String saveOrUpdate(@Validated Manager manager){
		 managerService.saveOrUpdate(manager);
		 return "redirect:/manager/managerlist";
	 }
	 
	 @AuthPassport
	 @RequestMapping(value="/input", method=RequestMethod.GET)
	 public String input(Map<String,Object> map) {
		 map.put("departments", managerService.getDepartments());
		 map.put("manager", new Manager());
		 return "/manage/manager/input";
	 }
	 
	 @RequestMapping(value="/updatePassword", method = RequestMethod.GET)
	 public String updatePassword() {
		 
		 return "/manage/updatePassword";
	 }
	 
	 @RequestMapping(value="/updatePassword", method = RequestMethod.POST)
	 public String updatePassword(@Param String password, HttpSession session) {
		 MD5Util md5Util = new MD5Util();
		 password = md5Util.MD5(password);
		 Manager man = (Manager) session.getAttribute("man");
	     man.setPassword(password);
		 managerService.updatePassword(man);
		 return "/manage/main";
	 }
}
