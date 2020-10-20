package com.jayymall.domain;

import java.util.Date;

public class MemberVO {

	/*
	 1) 테이블명의 컬럼명과 VO클래스의 필드(변수)명을 일치 시키는 경우
	 2) 테이블명의 컬럼명과 VO클래스의 필드(변수)명을 다르게 하는 경우 : 중간 작업이 필요하다.(mapper 파일에 resultMap을 사용해야 함.)
	 	- 데이터베이스 결과 데이터를 객체에 로드하는 방법을 정의하는 정의하는 엘리먼 사용해야 함
	*/
	
	/*
	 * CTRL + F : 찾기/바꾸기
	 * CTRL + Shift + y : 대문자 -> 소문자
	 * CTRL + Shift + x : 소문자 -> 대문자
	 * */
	
	private String	mem_id; 
	private String	mem_name; 
	private String	mem_pw; 
	private String	mem_email; 
	private String	mem_tel;
	private String	mem_zipcode;     
	private String	mem_basicadd;
	private String 	mem_detailadd;
	private String	mem_nickname; 
	private String 	mem_accept_e;
	private int		mem_point;
	private Date	mem_joindate;        
	private Date	mem_update;        
	private Date	mem_lastlogin;     
	private String	mem_authcode;
	private String  mem_session_key;
	private Date	mem_session_limit;
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_basicadd() {
		return mem_basicadd;
	}
	public void setMem_basicadd(String mem_basicadd) {
		this.mem_basicadd = mem_basicadd;
	}
	public String getMem_detailadd() {
		return mem_detailadd;
	}
	public void setMem_detailadd(String mem_detailadd) {
		this.mem_detailadd = mem_detailadd;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_accept_e() {
		return mem_accept_e;
	}
	public void setMem_accept_e(String mem_accept_e) {
		this.mem_accept_e = mem_accept_e;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public Date getMem_joindate() {
		return mem_joindate;
	}
	public void setMem_joindate(Date mem_joindate) {
		this.mem_joindate = mem_joindate;
	}
	public Date getMem_update() {
		return mem_update;
	}
	public void setMem_update(Date mem_update) {
		this.mem_update = mem_update;
	}
	public Date getMem_lastlogin() {
		return mem_lastlogin;
	}
	public void setMem_lastlogin(Date mem_lastlogin) {
		this.mem_lastlogin = mem_lastlogin;
	}
	public String getMem_authcode() {
		return mem_authcode;
	}
	public void setMem_authcode(String mem_authcode) {
		this.mem_authcode = mem_authcode;
	}
	public String getMem_session_key() {
		return mem_session_key;
	}
	public void setMem_session_key(String mem_session_key) {
		this.mem_session_key = mem_session_key;
	}
	public Date getMem_session_limit() {
		return mem_session_limit;
	}
	public void setMem_session_limit(Date mem_session_limit) {
		this.mem_session_limit = mem_session_limit;
	}
	
	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_name=" + mem_name + ", mem_pw=" + mem_pw + ", mem_email="
				+ mem_email + ", mem_tel=" + mem_tel + ", mem_zipcode=" + mem_zipcode + ", mem_basicadd=" + mem_basicadd
				+ ", mem_detailadd=" + mem_detailadd + ", mem_nickname=" + mem_nickname + ", mem_accept_e="
				+ mem_accept_e + ", mem_point=" + mem_point + ", mem_joindate=" + mem_joindate + ", mem_update="
				+ mem_update + ", mem_lastlogin=" + mem_lastlogin + ", mem_authcode=" + mem_authcode
				+ ", mem_session_key=" + mem_session_key + ", mem_session_limit=" + mem_session_limit + "]";
	}
		
}
