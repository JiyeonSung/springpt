package com.jayymall.domain;

/*
 * 장바구니에 담긴 상품목록을 위한 VO 객체
 */
public class CartProductVO {

	private int		cart_code;
	private int		cart_amount;
	private	int		product_num;
	private String	product_name;
	private	int		product_price;
	private int		product_discount;
	private String	product_img;
	
	
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
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
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	
	
	@Override
	public String toString() {
		return "CartProudctVO [cart_code=" + cart_code + ", cart_amount=" + cart_amount + ", product_num=" + product_num
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", product_discount="
				+ product_discount + ", product_img=" + product_img + "]";
	}
	
	
}
