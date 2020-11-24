package com.jayymall.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


public class ProductVO {
	
	private	int		product_num;
	private String	cat_code;
	private String	cat_parcode;  // 카테고리 테이블
	private	String	product_name;
	private	int		product_price;
	private	int 	product_discount;
	private	String  product_company;
	private String	product_detail;
	private String	product_img;
	private int		product_amount;
	private	String	product_buy;
	private	Date	product_date;
	private Date	product_update;

	
	// 업로드 파일
	private MultipartFile file1;

	/* Getter and Setter */
	public int getProduct_num() {
		return product_num;
	}
	
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

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

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_discount() {
		return product_discount;
	}

	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}

	public String getProduct_company() {
		return product_company;
	}

	public void setProduct_company(String product_company) {
		this.product_company = product_company;
	}

	public String getProduct_detail() {
		return product_detail;
	}

	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	public String getProduct_buy() {
		return product_buy;
	}

	public void setProduct_buy(String product_buy) {
		this.product_buy = product_buy;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public Date getProduct_update() {
		return product_update;
	}

	public void setProduct_update(Date product_update) {
		this.product_update = product_update;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	

	/* toString() */
	@Override
	public String toString() {
		return "ProductVO [product_num=" + product_num + ", cat_code=" + cat_code + ", cat_parcode=" + cat_parcode
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", product_discount="
				+ product_discount + ", product_company=" + product_company + ", product_detail=" + product_detail
				+ ", product_img=" + product_img + ", product_amount=" + product_amount + ", product_buy=" + product_buy
				+ ", product_date=" + product_date + ", product_update=" + product_update + ", file1=" + file1 + "]";
	}
	
}
