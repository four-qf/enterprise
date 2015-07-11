package com.cengze.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
public class Department implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer departmentid;
	
	private String departmentname;

	public Integer getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	@Override
	public String toString() {
		return "Department [departmentid=" + departmentid + ", departmentname="
				+ departmentname + "]";
	}
	
}
