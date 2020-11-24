package com.jayymall.domain;

import java.util.Date;

/*
 * 주문자 위주 정보
 * ord_num, mem_id, ord_name, ord_zipcode, ord_basicadd, ord_detailadd, ord_tel, ord_total_price, ord_date, ord_state
 */
public class OrderVO {

	private int		ord_num;
	private String	mem_id;
	private String	ord_name;
	private String	ord_zipcode;
	private String	ord_basicadd;
	private String	ord_detailadd;
	private	String	ord_tel;
	private	int		ord_total_price;
	private Date	ord_date;
	
	
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getOrd_name() {
		return ord_name;
	}
	public void setOrd_name(String ord_name) {
		this.ord_name = ord_name;
	}
	public String getOrd_zipcode() {
		return ord_zipcode;
	}
	public void setOrd_zipcode(String ord_zipcode) {
		this.ord_zipcode = ord_zipcode;
	}
	public String getOrd_basicadd() {
		return ord_basicadd;
	}
	public void setOrd_basicadd(String ord_basicadd) {
		this.ord_basicadd = ord_basicadd;
	}
	public String getOrd_detailadd() {
		return ord_detailadd;
	}
	public void setOrd_detailadd(String ord_detailadd) {
		this.ord_detailadd = ord_detailadd;
	}
	public String getOrd_tel() {
		return ord_tel;
	}
	public void setOrd_tel(String ord_tel) {
		this.ord_tel = ord_tel;
	}
	public int getOrd_total_price() {
		return ord_total_price;
	}
	public void setOrd_total_price(int ord_total_price) {
		this.ord_total_price = ord_total_price;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	
	
	@Override
	public String toString() {
		return "OrderVO [ord_num=" + ord_num + ", mem_id=" + mem_id + ", ord_name=" + ord_name + ", ord_zipcode="
				+ ord_zipcode + ", ord_basicadd=" + ord_basicadd + ", ord_detailadd=" + ord_detailadd + ", ord_tel="
				+ ord_tel + ", ord_total_price=" + ord_total_price + ", ord_date=" + ord_date + "]";
	}

}
