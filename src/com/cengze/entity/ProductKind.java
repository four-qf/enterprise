package com.cengze.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ProductKind implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer productkindid;
	
	private String productkindname;

	public Integer getProductkindid() {
		return productkindid;
	}

	public void setProductkindid(Integer productkindid) {
		this.productkindid = productkindid;
	}

	public String getProductkindname() {
		return productkindname;
	}

	public void setProductkindname(String productkindname) {
		this.productkindname = productkindname;
	}

}
