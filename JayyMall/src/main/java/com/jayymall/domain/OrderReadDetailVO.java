package com.jayymall.domain;

public class OrderReadDetailVO {
	
	private int		ord_amount;
	private int		product_num;
	private int		ord_price;
	private int		product_price;
	private String	product_name;
	private String	product_img;
	
	
	public int getOrd_amount() {
		return ord_amount;
	}
	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	
	@Override
	public String toString() {
		return "OrderReadDetailVO [ord_amount=" + ord_amount + ", product_num=" + product_num + ", ord_price="
				+ ord_price + ", product_price=" + product_price + ", product_name=" + product_name + ", product_img="
				+ product_img + "]";
	}
	
	

}
