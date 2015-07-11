package com.cengze.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.LeaveWords;
import com.cengze.entity.Manager;
import com.cengze.entity.Reply;
import com.cengze.entity.User;
import com.cengze.web.dao.WebUserDao;

@Service
@Transactional(readOnly=true, noRollbackFor={Exception.class})
public class WebUserService {

	@Resource
	private WebUserDao webUserDao;
	
	public User checkValiable(User user) {
		return webUserDao.checkValiable(user);
	}

	@Transactional
	public void save(User user) {
		webUserDao.save(user);
	}

	public User checkAccount(String account) {
		return webUserDao.checkAccount(account);
	}

	@Transactional
	public void saveWord(LeaveWords leavewords) {
		webUserDao.saveWord(leavewords);
	}

	public List<LeaveWords> getWordsList() {
		return webUserDao.getWordsList();
	}

	public List<Reply> getRely() {
		return webUserDao.getReply();
	}

}
