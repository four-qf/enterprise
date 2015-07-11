package com.cengze.manager.service;

import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.Department;
import com.cengze.entity.Manager;
import com.cengze.manager.dao.ManagerDao;

@Service
@Transactional(readOnly=true, noRollbackFor={Exception.class})
public class ManagerService {
   
	@Resource
	private ManagerDao managerDao;
	
	public List<Manager> list() {
		return managerDao.list();
	}

	@Transactional
	public void delete(String managerid) {
		managerDao.delete(managerid);
	}

	public Manager getManagerById(Integer managerid) {
		return managerDao.getManagerById(managerid);
	}

	public Collection<Department> getDepartments() {
		return managerDao.getDepartments();
	}

	@Transactional
	public void saveOrUpdate(Manager manager) {
		managerDao.saveOrUpdate(manager);
	}

	@Transactional
	public void updatePassword(Manager manager) {
		managerDao.updatePassword(manager);
	}

}
