package com.cengze.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.cengze.entity.News;
import com.cengze.util.PageUtil;
import com.cengze.util.auth.AuthPassport;
import com.cengze.web.service.WebNewsService;

@Controller
@RequestMapping(value="/web/news")
public class WebNewsController {
	
	@Resource
	private WebNewsService webNewsService;
	
	//获取全部新闻
	@AuthPassport
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(HttpSession session) {
		List<News> list = webNewsService.getNewsList();
		PageUtil  pageUtil = new PageUtil();
		pageUtil.getPageCount(list, session);
		session.setAttribute("newslist", list);
		return "/web/news/newslist";
	}
	
	//以新闻种类获取新闻
	@AuthPassport
	@RequestMapping(value="/list/{kindid}", method = RequestMethod.GET)
	public String list(HttpSession session, @PathVariable Integer kindid ) {
		List<News> list = webNewsService.getNewsListByKind(kindid);
		PageUtil pageUtil = new PageUtil();
		pageUtil.getPageCount(list, session);
		session.setAttribute("newslist", list) ;
		return "/web/news/newslist";
	}
	
	@AuthPassport
	@RequestMapping(value="/shownews/{newsid}", method = RequestMethod.GET)
	public String showNews(@PathVariable Integer newsid, Map<String,Object> map) {
		News news = webNewsService.getNewsById(newsid);
		map.put("news", news);
		return "/web/news/shownews";
	}
	
	@RequestMapping(value="/getPageNow/{pageNow}", method=RequestMethod.GET)
	public String getPageNow(@PathVariable Integer pageNow, HttpSession session) {
		session.setAttribute("pageNow", pageNow);
		return "/web/news/newslist";
	}
}
