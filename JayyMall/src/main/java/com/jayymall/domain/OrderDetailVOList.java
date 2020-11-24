package com.jayymall.domain;

import java.util.List;

public class OrderDetailVOList {

	// List<> 컬렉션으로 데이터를 받는 방법  orderDetailList
	private List<OrderDetailVO> orderDetailList;

	public List<OrderDetailVO> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetailVO> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}

	@Override
	public String toString() {
		return "OrderDetailVOList [orderDetailList=" + orderDetailList + "]";
	}

	
	
	
}
