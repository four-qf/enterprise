package com.cengze.web.dao.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.base.DaoBase;
import com.cengze.entity.LeaveWords;
import com.cengze.entity.Reply;
import com.cengze.entity.User;
import com.cengze.web.dao.WebUserDao;

@Repository
public class WebUserDaoImpl extends DaoBase implements WebUserDao{

	public User checkValiable(User user) {
		String hql = "From User u where u.account =? and u.password=?";
		return (User) getSession().createQuery(hql).setString(0, user.getAccount()).setString(1, user.getPassword()).uniqueResult();
	}

	public void save(User user) {
		getSession().save(user);
	}

	public User checkAccount(String account) {
		String hql = "From User where account = ?";
		return (User) getSession().createQuery(hql).setString(0, account).uniqueResult();
	}

	public void saveWord(LeaveWords leavewords) {
		leavewords.setCreatetime(new Timestamp(new Date().getTime()));
		getSession().save(leavewords);
	}

	@SuppressWarnings("unchecked")
	public List<LeaveWords> getWordsList() {
		String hql = "From LeaveWords ";
		return getSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	public List<Reply> getReply() {
		return getSession().createQuery("From Reply").list();
	}
	
}
