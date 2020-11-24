package com.jayymall.service;

import java.util.List;

import com.jayymall.domain.OrderDetailVOList;
import com.jayymall.domain.OrderListVO;
import com.jayymall.domain.OrderReadDetailVO;
import com.jayymall.domain.OrderVO;

public interface OrderService {

	// 주문 정보 추가 (상품 상세, 바로구매)
	public void addOrder(OrderVO order, OrderDetailVOList orderDetailList) throws Exception;	
	
	// 주문 정보 추가 (장바구니)
	public void addOrderCart(OrderVO order, OrderDetailVOList orderDetailList, String mem_id) throws Exception;
	
	// 주문 목록
	public List<OrderListVO> orderList(String mem_id) throws Exception;
	
	// 주문 상세 정보
	public List<OrderReadDetailVO> readOrder(int ord_num) throws Exception;
	
	// 주문자 정보
	public OrderVO getOrder(int ord_num) throws Exception;
}
