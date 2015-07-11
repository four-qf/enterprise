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
import com.cengze.entity.NewsKind;

@Entity
public class News implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer newsid;
	
	private String newstitle;
	
	@ManyToOne(targetEntity = NewsKind.class)
	@JoinColumn(name="kindid", referencedColumnName="kindid")
	private NewsKind newskind;
	
	@Column(length = 16777216)
	private String newscontent;
	
	@ManyToOne(targetEntity = Manager.class)
	@JoinColumn(name="managerid", referencedColumnName="managerid")
	private Manager manager;
	
	private Timestamp createtime;

	public Integer getNewsid() {
		return newsid;
	}

	public void setNewsid(Integer newsid) {
		this.newsid = newsid;
	}

	public String getNewstitle() {
		return newstitle;
	}

	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}

	public NewsKind getNewskind() {
		return newskind;
	}

	public void setNewskind(NewsKind newskind) {
		this.newskind = newskind;
	}

	public String getNewscontent() {
		return newscontent;
	}

	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "News [newsid=" + newsid + ", newstitle=" + newstitle
				+ ", newskind=" + newskind + ", newscontent=" + newscontent
				+ ", manager=" + manager + ", createtime=" + createtime + "]";
	}
	
}
