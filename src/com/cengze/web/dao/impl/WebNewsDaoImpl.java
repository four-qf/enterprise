package com.cengze.web.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.News;
import com.cengze.entity.NewsKind;
import com.cengze.web.dao.WebNewsDao;

@Repository
public class WebNewsDaoImpl extends DaoBase implements WebNewsDao {

	@SuppressWarnings("unchecked")
	public List<News> getNewsList() {
		String hql = "From News n order by n.createtime desc" ; 
		return getSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NewsKind> getNewsKinds() {
		return getSession().createQuery("From NewsKind").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<News> getNewsListByKind(Integer kindid) {
		String hql = "From News where kindid = ? order by createtime desc" ;
		return getSession().createQuery(hql).setInteger(0, kindid).list();
	}

	@Override
	public News getNewsById(Integer newsid) {
		String hql = "From News n where n.newsid = ?";
		return (News) getSession().createQuery(hql).setInteger(0, newsid).uniqueResult();
	}

}
