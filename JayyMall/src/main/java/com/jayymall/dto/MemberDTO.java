package com.jayymall.dto;

import java.util.Date;

public class MemberDTO {
	
	private String mem_id;
	private String mem_pw;
	private String mem_nickname;
	private String mem_name;
	private String mem_point;
	private Date mem_lastlogin;
	private boolean useCookie;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_point() {
		return mem_point;
	}
	public void setMem_point(String mem_point) {
		this.mem_point = mem_point;
	}
	public Date getMem_lastlogin() {
		return mem_lastlogin;
	}
	public void setMem_lastlogin(Date mem_lastlogin) {
		this.mem_lastlogin = mem_lastlogin;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_nickname=" + mem_nickname + ", mem_name="
				+ mem_name + ", mem_point=" + mem_point + ", mem_lastlogin=" + mem_lastlogin + ", useCookie="
				+ useCookie + "]";
	}

}

/*
// 아이디와 비번 입력정보를 저장 용도
public class MemberDTO {

	public boolean isUseCookie() {
		// TODO Auto-generated method stub
		return false;
	}

	public void setMem_id(String mem_id) {
		// TODO Auto-generated method stub
		
	}

	public void setMem_pw(String mem_pw) {
		// TODO Auto-generated method stub
		
	}

	public String getMem_pw() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getMem_id() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
*/