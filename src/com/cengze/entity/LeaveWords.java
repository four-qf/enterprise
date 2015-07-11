package com.cengze.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class LeaveWords implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long wordid;
	
	@Column(length = 2216)
	private String wordcontent;
	
	@ManyToOne(targetEntity=User.class)
	@JoinColumn(name="account", referencedColumnName="account")
	private User user;
	
	private Timestamp createtime;

	public Long getWordid() {
		return wordid;
	}

	public void setWordid(Long wordid) {
		this.wordid = wordid;
	}

	public String getWordcontent() {
		return wordcontent;
	}

	public void setWordcontent(String wordcontent) {
		this.wordcontent = wordcontent;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "LeaveWords [wordid=" + wordid + ", wordcontent=" + wordcontent
				+ ", user=" + user + ", createtime=" + createtime + "]";
	}
	
}
