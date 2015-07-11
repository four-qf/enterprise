package com.cengze.manager.service;

import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.News;
import com.cengze.entity.NewsKind;
import com.cengze.manager.dao.NewsDao;

@Service
@Transactional(readOnly=true, noRollbackFor={Exception.class})
public class NewsService {
	
	@Resource
	private NewsDao newsDao;

	public Collection<NewsKind> getNewsKinds() {
		return newsDao.getNewsKinds();
	}

	@Transactional
	public void saveOrUpdate(News news) {
		newsDao.saveOrUpdate(news);
	}

	public List<News> getAllNews(Integer kindid) {
		return newsDao.getAllNews(kindid);
	}
	
	@Transactional
	public void delete(String newsid) {
		newsDao.delete(newsid);
	}

	public News getNewsById(Integer newsid) {
		return newsDao.getNewsById(newsid);
	}

}
