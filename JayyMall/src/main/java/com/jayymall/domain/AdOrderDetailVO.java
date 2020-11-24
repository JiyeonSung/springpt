package com.jayymall.domain;

import java.util.Date;

public class AdOrderDetailVO {

/*
product_num, cat_code, cat_parcode, product_name, product_price, product_discount, product_company, product_detail,
product_img, product_amount, product_buy, product_date, product_update,
ord_num, product_num, ord_amount, ord_price
 */
	
	private int 	product_num;
	private int 	cat_code;
	private int 	cat_parcode;
	private String	product_name;
	private	int		product_price;
	private int		product_discount;
	private String	product_company;
	private String	product_detail;
	private String 	product_img;
	private int		product_amount;
	private String	product_buy;
	private Date	product_date;
	private Date	product_update;
	private int		ord_num;
	private int		ord_amount;
	private int		ord_price;
	
	
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getCat_code() {
		return cat_code;
	}
	public void setCat_code(int cat_code) {
		this.cat_code = cat_code;
	}
	public int getCat_parcode() {
		return cat_parcode;
	}
	public void setCat_parcode(int cat_parcode) {
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
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
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
		return "AdOrderDeVO [product_num=" + product_num + ", cat_code=" + cat_code + ", cat_parcode=" + cat_parcode
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", product_discount="
				+ product_discount + ", product_company=" + product_company + ", product_detail=" + product_detail
				+ ", product_img=" + product_img + ", product_amount=" + product_amount + ", product_buy=" + product_buy
				+ ", product_date=" + product_date + ", product_update=" + product_update + ", ord_num=" + ord_num
				+ ", ord_amount=" + ord_amount + ", ord_price=" + ord_price + "]";
	}
	
}
