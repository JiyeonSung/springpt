package com.jayymall.domain;

/*
 * 장바구니 테이블 VO 객체
 */
public class CartVO {

	private int		cart_code;
	private int		product_num;
	private String	mem_id;
	private int		cart_amount;
	
	
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	
	@Override
	public String toString() {
		return "CartProudctVO [cart_code=" + cart_code + ", product_num=" + product_num + ", mem_id=" + mem_id
				+ ", cart_amount=" + cart_amount + "]";
	}
	
}
