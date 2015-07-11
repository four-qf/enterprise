package com.cengze.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
public class Manager implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long managerid;
	
	private String managername;
	
	private String password;
	
	private String position ;
	
	@ManyToOne(targetEntity = Department.class)
	@JoinColumn(name="departmentid",referencedColumnName="departmentid")
	private Department department;

	public Long getManagerid() {
		return managerid;
	}

	public void setManagerid(Long managerid) {
		this.managerid = managerid;
	}

	public String getManagername() {
		return managername;
	}

	public void setManagername(String managername) {
		this.managername = managername;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Manager [managerid=" + managerid + ", managername="
				+ managername + ", password=" + password + ", position="
				+ position + ", department=" + department + "]";
	}

	
}
