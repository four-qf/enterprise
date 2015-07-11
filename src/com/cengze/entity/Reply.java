package com.cengze.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Reply implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long replyid;
	
	private String replycontent;
	
	@ManyToOne(targetEntity = Manager.class)
	@JoinColumn(name="managerid", referencedColumnName="managerid")
	private Manager manager;
	
	private Timestamp replytime;
	
	@ManyToOne(targetEntity = LeaveWords.class)
	@JoinColumn(name="wordid", referencedColumnName="wordid")
	private LeaveWords leaveWords;

	public Long getReplyid() {
		return replyid;
	}

	public void setReplyid(Long replyid) {
		this.replyid = replyid;
	}

	public LeaveWords getLeaveWords() {
		return leaveWords;
	}

	public void setLeaveWords(LeaveWords leaveWords) {
		this.leaveWords = leaveWords;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public Timestamp getReplytime() {
		return replytime;
	}

	public void setReplytime(Timestamp replytime) {
		this.replytime = replytime;
	}

	@Override
	public String toString() {
		return "Reply [replyid=" + replyid + ", replycontent=" + replycontent
				+ ", manager=" + manager + ", replytime=" + replytime
				+ ", leaveWords=" + leaveWords + "]";
	}

}
