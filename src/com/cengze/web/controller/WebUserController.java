package com.cengze.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cengze.entity.LeaveWords;
import com.cengze.entity.Reply;
import com.cengze.entity.User;
import com.cengze.util.MD5Util;
import com.cengze.util.PageUtil;
import com.cengze.util.auth.AuthPassport;
import com.cengze.web.service.WebUserService;

@Controller
@RequestMapping("/web")
public class WebUserController {

	@Resource
	private WebUserService webUserService;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String regist(@Validated User user) {
		String password = (new MD5Util()).MD5(user.getPassword());
		user.setPassword(password);
		webUserService.save(user);
		return "/web/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkAccount/{account}", method= RequestMethod.POST)
	public String checkAccount(@PathVariable String account) {
		User user = webUserService.checkAccount(account);
		if(user != null){
			return "-1";
		}else{
			return "1";
		}
		
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@Validated User user, @RequestParam String checkcode, HttpServletRequest request) {
		String code = (String) request.getSession().getAttribute("code");
		if(code.equalsIgnoreCase(checkcode)){
			String password = (new MD5Util()).MD5(user.getPassword());
			user.setPassword(password);
			user = webUserService.checkValiable(user);
            if(user == null){
            	request.setAttribute("error", "密码或账户错误");
            	return "/web/login";
            }else{
                request.getSession().setAttribute("user", user);
            	return "redirect:/";
            }		
			
		}else {
			request.setAttribute("error", "验证码输入错误");
			return "/web/login";
		}
		
	}
	
	@AuthPassport
	//在线留言
	@RequestMapping(value="/user/leavewords", method=RequestMethod.GET)
	public String leavewords(HttpSession session) {
		List<LeaveWords> wordslist = webUserService.getWordsList();
		List<Reply> replylist = webUserService.getRely();
		System.out.println(replylist);
		System.out.println(wordslist);
		PageUtil pageUtil = new PageUtil();
		pageUtil.getPageCount(wordslist, session);
		session.setAttribute("replylist", replylist);
		session.setAttribute("wordslist", wordslist);
		return "/web/user/leaveword";
	}
	
	@RequestMapping(value="/user/leave", method=RequestMethod.POST)
	public String leave(@Validated LeaveWords leavewords, HttpSession session) {
		leavewords.setUser((User) session.getAttribute("user"));
		webUserService.saveWord(leavewords);
		return "redirect:/web/user/leavewords";
	}
	
	@RequestMapping(value="/user/getPageNow/{pageNow}", method=RequestMethod.GET)
	public String getPageNow(@PathVariable Integer pageNow, HttpSession session) {
		session.setAttribute("pageNow", pageNow);
		return "/web/user/leaveword";
	}
}
