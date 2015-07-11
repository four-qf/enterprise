package com.cengze.manager.dao;

import java.util.Collection;
import java.util.List;

import com.cengze.entity.Department;
import com.cengze.entity.Manager;

public interface ManagerDao  {
	List<Manager> list();

	void delete(String managerid);

	Manager getManagerById(Integer managerid);

	Collection<Department> getDepartments();

	void saveOrUpdate(Manager manager);

	void updatePassword(Manager man);

}
