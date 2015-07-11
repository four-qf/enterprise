package com.cengze.manager.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cengze.entity.LeaveWords;
import com.cengze.entity.Reply;
import com.cengze.entity.User;

public interface UserDao {

	public List<User> getUserList() ;

	public void delete(String account);

	public List<LeaveWords> getWordList();

	public void deleteWords(String wordid);

	public Reply getReply(Long wordid);

	public LeaveWords getWordsById(Long wordid);

	public void saveReply(Reply reply);


}
