package com.jayymall.domain;

import java.util.Date;

/*
 * 상품 후기 테이블 VO 객체
 */
public class ReviewVO {
	
	
	private int 	rv_num;
	private String 	mem_id;
	private int		product_num;
	private String	rv_content;
	private int 	rv_score;
	private Date	rv_date;
	
	public int getRv_num() {
		return rv_num;
	}
	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public int getRv_score() {
		return rv_score;
	}
	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	
	
	@Override
	public String toString() {
		return "ReviewVO [rv_num=" + rv_num + ", mem_id=" + mem_id + ", product_num=" + product_num + ", rv_content="
				+ rv_content + ", rv_score=" + rv_score + ", rv_date=" + rv_date + "]";
	}
	
}
