package com.cengze.base;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class DaoBase {
	
	@Resource
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
    public Session getSession() {
    	return this.sessionFactory.getCurrentSession();
    }	
}
