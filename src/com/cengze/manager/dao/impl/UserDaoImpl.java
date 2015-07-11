package com.cengze.manager.dao.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.LeaveWords;
import com.cengze.entity.Reply;
import com.cengze.entity.User;
import com.cengze.manager.dao.UserDao;

@Repository
public class UserDaoImpl extends DaoBase implements UserDao{

	@SuppressWarnings("unchecked")
	public List<User> getUserList() {
		return getSession().createQuery("From User").list();
	}

	public void delete(String account) {
		String hql = "delete from User u where u.account in (" + account + ")";
		getSession().createQuery(hql).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<LeaveWords> getWordList() {
		return getSession().createQuery("From LeaveWords").list();
	}

	public void deleteWords(String wordid) {
		String hql ="delete From LeaveWords l where wordid in(" + wordid + ")";
		getSession().createQuery(hql).executeUpdate();
	}

	public Reply getReply(Long wordid) {
		String hql ="From Reply where wordid = ?";
		return (Reply) getSession().createQuery(hql).setLong(0, wordid).uniqueResult();
	}

	public LeaveWords getWordsById(Long wordid) {
		String hql = "From LeaveWords  where wordid = ?";
		return (LeaveWords) getSession().createQuery(hql).setLong(0, wordid).uniqueResult();
	}

	public void saveReply(Reply reply) {
		reply.setReplytime(new Timestamp(new Date().getTime()));
		getSession().save(reply);
	}
	
}
