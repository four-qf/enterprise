package com.cengze.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.Manager;
import com.cengze.manager.dao.LoginDao;

@Service
@Transactional(readOnly = true, noRollbackFor = {Exception.class})
public class LoginService {

	@Autowired
	private LoginDao loginDao;
	
	public Manager checkValiable(Manager manager) {
		return loginDao.checkValiable(manager);
	}
	
	
}
