package com.cengze.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.News;
import com.cengze.entity.NewsKind;
import com.cengze.web.dao.WebNewsDao;

@Service
@Transactional(readOnly=true, noRollbackFor = {Exception.class})
public class WebNewsService {

	@Resource
	private WebNewsDao webNewsDao;
	
	public List<News> getNewsList() {
		return webNewsDao.getNewsList();
	}

	public List<NewsKind> getNewsKinds() {
		return webNewsDao.getNewsKinds();
	}

	
	public List<News> getNewsListByKind(Integer kindid) {
		return webNewsDao.getNewsListByKind(kindid);
	}

	public News getNewsById(Integer newsid) {
		return webNewsDao.getNewsById(newsid);
	}

}
