package com.cengze.manager.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cengze.entity.Manager;
import com.cengze.entity.News;
import com.cengze.manager.service.NewsService;
import com.cengze.util.PageUtil;
import com.cengze.util.auth.AuthPassport;

@Controller
@RequestMapping("/manager")
public class NewsController {

	@Resource
	private NewsService newsService;

	@ModelAttribute
	public void getNews(
			@RequestParam(value = "newsid", required = false) Integer newsid,
			Map<String, Object> map) {
		if (newsid != null) {
			map.put("news", newsService.getNewsById(newsid));
		}
	}

	@AuthPassport(managertype = "news")
	@RequestMapping(value = "/newsList/{kindid}", method = RequestMethod.GET)
	public String list(HttpSession session, @PathVariable Integer kindid) {
		List<News> newslist = newsService.getAllNews(kindid);
		PageUtil pageUtil = new PageUtil();
		pageUtil.getPageCount(newslist, session);
		session.setAttribute("newslist", newslist);
		return "/manage/news/list";
	}

	@RequestMapping(value = "/getNewPageNow/{pageNow}", method = RequestMethod.GET)
	public String getPageNow(@PathVariable int pageNow, HttpSession session) {
		session.setAttribute("pageNow", pageNow);
		return "/manage/news/list";
	}

	@AuthPassport(managertype="news")
	@RequestMapping(value = "/inputNews", method = RequestMethod.GET)
	public String input(Map<String, Object> map) {
		map.put("newskinds", newsService.getNewsKinds());
		map.put("news", new News());
		return "/manage/news/inputNews";
	}

	@RequestMapping(value = "/inputNews/{newsid}", method = RequestMethod.GET)
	public String input(Map<String, Object> map, @PathVariable Integer newsid) {
		map.put("news", newsService.getNewsById(newsid));
		map.put("newskinds", newsService.getNewsKinds());
		return "/manage/news/inputNews";
	}

	@RequestMapping(value = "/saveOrUpdateNews", method = RequestMethod.POST)
	public String saveOrUpdate(@Validated News news, HttpSession session) {
		news.setManager((Manager) session.getAttribute("man"));
		newsService.saveOrUpdate(news);
		Integer kindid = news.getNewskind().getKindid();
		return "redirect:/manager/newsList/" + kindid;
	}

	@RequestMapping(value = "/deleteNews", method = RequestMethod.DELETE)
	public String delete(@Param String newsid) {
		newsService.delete(newsid);
		return "redirect:/manager/main";
	}
}
