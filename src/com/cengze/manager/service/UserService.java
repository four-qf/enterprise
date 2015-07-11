package com.cengze.manager.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cengze.entity.LeaveWords;
import com.cengze.entity.Reply;
import com.cengze.entity.User;
import com.cengze.manager.dao.UserDao;

@Service
@Transactional(readOnly=true, noRollbackFor={Exception.class})
public class UserService {
	
	@Resource
	private UserDao userDao;

	public List<User> getUserList() {
		return userDao.getUserList();
	}

	@Transactional
	public void delete(String account) {
		userDao.delete(account);
	}

	public List<LeaveWords> getWordlist() {
		return userDao.getWordList();
	}

	@Transactional
	public void deleteWords(String wordid) {
		userDao.deleteWords(wordid);
	}

	public Reply getReply(Long wordid) {
		return userDao.getReply(wordid);
	}

	public LeaveWords getWordsById(Long wordid) {
		return userDao.getWordsById(wordid);
	}

	@Transactional
	public void saveReply(Reply reply) {
		userDao.saveReply(reply);
	}
	
	
}
