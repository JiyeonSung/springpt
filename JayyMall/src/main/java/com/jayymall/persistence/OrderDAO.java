package com.jayymall.persistence;

import java.util.List;

import com.jayymall.domain.OrderDetailVO;
import com.jayymall.domain.OrderListVO;
import com.jayymall.domain.OrderReadDetailVO;
import com.jayymall.domain.OrderVO;


public interface OrderDAO {

	// 주문 코드 시퀀스 가져오기
	public int readOrderCode() throws Exception;
	
	// 주문 내역 추가
	public void addOrderDetail(OrderDetailVO vo) throws Exception;
	
	// 주문 정보 추가
	public void addOrder(OrderVO vo) throws Exception;
	
	// 주문 목록
	public List<OrderListVO> orderList(String mem_id) throws Exception;
	
	// 주문 상세 정보
	public List<OrderReadDetailVO> readOrder(int ord_num) throws Exception;
	
	// 주문자 정보
	public OrderVO getOrder(int ord_num) throws Exception;
}
