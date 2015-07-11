package com.cengze.web.dao;

import java.util.List;

import com.cengze.entity.LeaveWords;
import com.cengze.entity.Reply;
import com.cengze.entity.User;

public interface WebUserDao {

	public User checkValiable(User user);

	public void save(User user);

	public User checkAccount(String account);

	public void saveWord(LeaveWords leavewords);

	public List<LeaveWords> getWordsList();

	public List<Reply> getReply();

}
