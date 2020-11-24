package com.jayymall.persistence;

import java.util.List;

import com.jayymall.domain.AdOrderDetailVO;
import com.jayymall.domain.OrderReadDetailVO;
import com.jayymall.domain.OrderVO;
import com.jayymall.util.SearchCriteria;

public interface AdOrderDAO {

	// 주문 리스트
	public List<OrderVO> searchListOrder(SearchCriteria cri) throws Exception;
	
	// 검색조건에 해당하는 주문 개수 
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	// 주문 상세 정보
	public List<OrderReadDetailVO> readOrder(int ord_num) throws Exception;
	
	// 주문자 정보
	public OrderVO getOrder(int ord_num) throws Exception;
	
	// 주문 삭제
	public void deleteOrder(int ord_num) throws Exception;
	
	// 주문 상세
	public List<AdOrderDetailVO> orderDetail(int ord_num) throws Exception;

}
