package com.jayymall.domain;

/*
 * 상품 정보 위주
 */
public class OrderDetailVO {

	private int	ord_num;
	private int product_num;
	private int ord_amount;
	private int ord_price;
	
	
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
	
	
	@Override
	public String toString() {
		return "OrderDetailVO [ord_num=" + ord_num + ", product_num=" + product_num + ", ord_amount=" + ord_amount
				+ ", ord_price=" + ord_price + "]";
	}
}
