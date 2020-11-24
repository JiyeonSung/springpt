package com.jayymall.domain;

import java.util.Date;

public class AdminVO {

	private String 	admin_id;
	private String 	admin_pw;
	private String 	admin_name;
	private Date	admin_lastlogin;
	
	/* Getter and Setter */
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public Date getAdmin_lastlogin() {
		return admin_lastlogin;
	}
	public void setAdmin_lastlogin(Date admin_lastlogin) {
		this.admin_lastlogin = admin_lastlogin;
	}
	
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", admin_name=" + admin_name
				+ ", admin_lastlogin=" + admin_lastlogin + "]";
	}
	
}
