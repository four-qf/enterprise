package com.cengze.manager.dao.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.Department;
import com.cengze.entity.Manager;
import com.cengze.manager.dao.ManagerDao;

@Repository
public class ManagerDaoImpl extends DaoBase implements ManagerDao{

	public List<Manager> list() {
		String hql = "From Manager";
		@SuppressWarnings("unchecked")
		List<Manager> list = (List<Manager>)getSession().createQuery(hql).list();
		return list;
	}

	public void delete(String managerid) {
		String hql = "delete from Manager m where m.managerid in( "+ managerid+ " )";
	    getSession().createQuery(hql).executeUpdate();
	}

	public Manager getManagerById(Integer managerid) {
		String hql = "From Manager m where managerid = ? ";
		Manager manager = (Manager) getSession().createQuery(hql).setInteger(0, managerid).uniqueResult();
		return manager;
	}

	@SuppressWarnings("unchecked")
	public Collection<Department> getDepartments() {
		return getSession().createQuery("From Department").list();
	}

	@Override
	public void saveOrUpdate(Manager manager) {
		getSession().saveOrUpdate(manager);
	}

	public void updatePassword(Manager manager) {
		getSession().saveOrUpdate(manager);
	}

}
