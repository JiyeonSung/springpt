package com.jayymall.domain;

import java.util.Date;

public class OrderListVO {
	
	private String		product_img;
	private	String		product_name;
	private	int			ord_num;
	private int			product_num;
	private	int			ord_amount;
	private int			ord_price;
	private	Date		ord_date;
	
	
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getOrd_amount() {
		return ord_amount;
	}
	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	
	
	@Override
	public String toString() {
		return "OrderListVO [product_img=" + product_img + ", product_name=" + product_name + ", ord_num=" + ord_num
				+ ", product_num=" + product_num + ", ord_amount=" + ord_amount + ", ord_price=" + ord_price
				+ ", ord_date=" + ord_date + "]";
	}
	
	
	
	

}
