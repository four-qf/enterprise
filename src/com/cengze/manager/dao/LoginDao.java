package com.cengze.manager.dao;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.Manager;

@Repository
public class LoginDao extends DaoBase {
	
	public Manager checkValiable(Manager manager) {
		String hql = " From Manager m where m.managerid=? and m.password=? ";
		return (Manager) getSession().createQuery(hql).setLong(0, manager.getManagerid()).setString(1, manager.getPassword()).uniqueResult();
	}

}
