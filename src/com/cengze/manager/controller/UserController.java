package com.cengze.manager.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cengze.entity.LeaveWords;
import com.cengze.entity.Manager;
import com.cengze.entity.Reply;
import com.cengze.entity.User;
import com.cengze.manager.service.UserService;
import com.cengze.util.PageUtil;
import com.cengze.util.auth.AuthPassport;

@Controller
@RequestMapping("/manager")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@AuthPassport(managertype="PR")
	@RequestMapping(value="/userlist", method=RequestMethod.GET)
	public String list(HttpSession session) {
		List<User> userlist = userService.getUserList();
		PageUtil pageUtil = new PageUtil();
		pageUtil.getPageCount(userlist, session);
		session.setAttribute("userlist", userlist);
		return "/manage/user/list";
	}
	
	 @RequestMapping(value="/user/getPageNow/{pageNow}",method=RequestMethod.GET)
	 public String getPageNow(@PathVariable int pageNow, HttpSession session) {
		 session.setAttribute("pageNow", pageNow);
		 return "/manage/user/list";
	 }
	 
	 @RequestMapping(value="/user/getPageNow",method=RequestMethod.POST)
	 public String pageNow(@Param Integer pageNow, HttpSession session) {
		 session.setAttribute("pageNow", pageNow);
		 return "/manage/user/list";
	 }
	 
	 @RequestMapping(value="/user/delete", method = RequestMethod.DELETE)
	 public String delete(@Param String account) {
		 userService.delete(account);
		 return "redirect:/manager/userlist";
	 }
	 
	 @AuthPassport(managertype="PR")
	 @RequestMapping(value="/user/leavewords", method= RequestMethod.GET)
	 public String leavewords(HttpSession session) {
		 List<LeaveWords> wordslist = userService.getWordlist();
		 session.setAttribute("wordslist", wordslist);
		 PageUtil pageUtil = new PageUtil();
		 pageUtil.getPageCount(wordslist, session);
		 return "/manage/user/leavewords";
	 }
	 
	 public String deleteWords(@Param String wordid) {
		 userService.deleteWords(wordid);
		 return "redirect:/manager/user/leavewords";
	 } 
	 
	 @RequestMapping(value="/user/inputWords/{wordid}", method=RequestMethod.GET)
	 public String inputWords(@PathVariable Long wordid, Map<String, Object> map) {
		 Reply reply = userService.getReply(wordid);
		 System.out.println(reply);
		 if(reply == null){
			 reply = new Reply();
			 System.out.println(reply);
		 }
		 map.put("reply", reply);
		 map.put("leavewords", userService.getWordsById(wordid));
		 return "/manage/user/reply";
	 }
	 
	 @RequestMapping(value="/user/reply", method=RequestMethod.POST)
	 public String reply(@Validated Reply reply, HttpSession session, @Param Long wordid){
		 Manager man = (Manager) session.getAttribute("man");
		 reply.setManager(man);
		 LeaveWords leaveWords = new LeaveWords();
		 leaveWords.setWordid(wordid);
		 reply.setLeaveWords(leaveWords);
		 userService.saveReply(reply);
		 return "/manage/user/leavewords";
	 }
}
