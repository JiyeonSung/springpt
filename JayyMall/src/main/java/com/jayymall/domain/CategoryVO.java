package com.jayymall.domain;

/*
 * 카테고리 테이블
 */
public class CategoryVO {
	
	private String cat_code;
	private String cat_parcode;
	private String cat_name;
	
	/* Getter and Setter */
	public String getCat_code() {
		return cat_code;
	}
	public void setCat_code(String cat_code) {
		this.cat_code = cat_code;
	}
	public String getCat_parcode() {
		return cat_parcode;
	}
	public void setCat_parcode(String cat_parcode) {
		this.cat_parcode = cat_parcode;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	
	/* toString() */
	@Override
	public String toString() {
		return "CategoryVO [cat_code=" + cat_code + ", cat_parcode=" + cat_parcode + ", cat_name=" + cat_name + "]";
	}
}
