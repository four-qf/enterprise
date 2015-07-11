package com.cengze.manager.dao;

import java.util.Collection;
import java.util.List;

import com.cengze.entity.News;
import com.cengze.entity.NewsKind;

public interface NewsDao {

	public Collection<NewsKind> getNewsKinds() ;

	public void saveOrUpdate(News news);

	public List<News> getAllNews(Integer kindid);

	public void delete(String newsid);

	public News getNewsById(Integer newsid);

}
