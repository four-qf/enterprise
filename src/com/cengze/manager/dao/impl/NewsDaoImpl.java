package com.cengze.manager.dao.impl;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.News;
import com.cengze.entity.NewsKind;
import com.cengze.manager.dao.NewsDao;

@Repository
public class NewsDaoImpl extends DaoBase implements NewsDao{

	@SuppressWarnings("unchecked")
	public Collection<NewsKind> getNewsKinds() {
		return getSession().createQuery("From NewsKind").list();
	}

	@Override
	public void saveOrUpdate(News news) {
		news.setCreatetime(new Timestamp(new Date().getTime()));
		getSession().saveOrUpdate(news);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<News> getAllNews(Integer kindid) {
		String hql = "From News where kindid = ?" ;
		return getSession().createQuery(hql).setInteger(0, kindid).list();
	}

	@Override
	public void delete(String newsid) {
		String hql = "DELETE from News n where n.newsid in( " + newsid + ")" ;
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public News getNewsById(Integer newsid) {
		String hql = "From News where newsid = ? ";
		return (News) getSession().createQuery(hql).setInteger(0, newsid).uniqueResult();
	}
	
}
