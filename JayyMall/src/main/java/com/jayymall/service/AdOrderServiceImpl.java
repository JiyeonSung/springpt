package com.jayymall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jayymall.domain.AdOrderDetailVO;
import com.jayymall.domain.OrderReadDetailVO;
import com.jayymall.domain.OrderVO;
import com.jayymall.persistence.AdOrderDAO;
import com.jayymall.util.SearchCriteria;

@Service
public class AdOrderServiceImpl implements AdOrderService {

	@Autowired
	AdOrderDAO dao;
	
	// 주문 리스트
	@Override
	public List<OrderVO> searchListOrder(SearchCriteria cri) throws Exception {
		return dao.searchListOrder(cri);
	}

	// 검색 조건에 맞는 주문 개수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}
	
	
	// 주문 상세 정보
	@Override
	public List<OrderReadDetailVO> readOrder(int ord_num) throws Exception {
		return dao.readOrder(ord_num);
	}
	
	// 주문자 정보
	@Override
	public OrderVO getOrder(int ord_num) throws Exception {
		return dao.getOrder(ord_num);
	}

	// 주문 삭제
	@Override
	public void deleteOrder(int ord_num) throws Exception {
		dao.deleteOrder(ord_num);
	}
	
	// 주문 상세
	@Override
	public List<AdOrderDetailVO> orderDetail(int ord_num) throws Exception {
		return dao.orderDetail(ord_num);
	}

}
