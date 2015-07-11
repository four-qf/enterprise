package com.cengze.web.dao;

import java.util.List;

import com.cengze.entity.News;
import com.cengze.entity.NewsKind;

public interface WebNewsDao {

	List<News> getNewsList();

	List<NewsKind> getNewsKinds();

	List<News> getNewsListByKind(Integer kindid);

	News getNewsById(Integer newsid);

}
