package com.jayymall.dto;

public class GoogleChartDTO {

	private	String product_name;
	private int product_price;
	
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
	
	@Override
	public String toString() {
		return "CartDTO [product_name=" + product_name + ", product_price=" + product_price + "]";
	}
}
