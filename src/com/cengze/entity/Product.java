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

@Entity
public class Product implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long productid;

	private String productname;
	@Column(length = 16777216)
	private String productbrief;
	
	private String imagesoldname;
	
	private String imagesnewname;
	
	@ManyToOne(targetEntity = Manager.class)
	@JoinColumn(name="managerid", referencedColumnName="managerid")
	private Manager manager;

	@ManyToOne(targetEntity = ProductKind.class)
	@JoinColumn(name="productkindid", referencedColumnName="productkindid")
	private ProductKind productkind;

	private Timestamp markettime;
	
	public Timestamp getMarkettime() {
		return markettime;
	}

	public void setMarkettime(Timestamp markettime) {
		this.markettime = markettime;
	}

	public Long getProductid() {
		return productid;
	}

	public void setProductid(Long productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductbrief() {
		return productbrief;
	}

	public void setProductbrief(String productbrief) {
		this.productbrief = productbrief;
	}

	public String getImagesoldname() {
		return imagesoldname;
	}

	public void setImagesoldname(String imagesoldname) {
		this.imagesoldname = imagesoldname;
	}

	public String getImagesnewname() {
		return imagesnewname;
	}

	public void setImagesnewname(String imagesnewname) {
		this.imagesnewname = imagesnewname;
	}

	public ProductKind getProductkind() {
		return productkind;
	}

	public void setProductkind(ProductKind productkind) {
		this.productkind = productkind;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "Product [productid=" + productid + ", productname="
				+ productname + ", productbrief=" + productbrief
				+ ", imagesoldname=" + imagesoldname + ", imagesnewname="
				+ imagesnewname + ", productkind=" + productkind + ", manager="
				+ manager + "]";
	}
	
}
