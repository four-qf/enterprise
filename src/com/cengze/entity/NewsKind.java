package com.cengze.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class NewsKind implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer kindid;
	
	private String kindname;

	public Integer getKindid() {
		return kindid;
	}

	public void setKindid(Integer kindid) {
		this.kindid = kindid;
	}

	public String getKindname() {
		return kindname;
	}

	public void setKindname(String kindname) {
		this.kindname = kindname;
	}
	
}
