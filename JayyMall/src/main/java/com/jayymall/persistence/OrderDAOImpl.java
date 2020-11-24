package com.jayymall.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jayymall.domain.OrderDetailVO;
import com.jayymall.domain.OrderListVO;
import com.jayymall.domain.OrderReadDetailVO;
import com.jayymall.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession session;
	public final static String NS = "com.jayymall.mappers.orderMapper";
	
	// 주문 코드 시퀀스 가져오기
	@Override
	public int readOrderCode() throws Exception {
		return session.selectOne(NS + ".readOrderCode");
	}
	
	// 주문 내역 추가
	@Override
	public void addOrderDetail(OrderDetailVO vo) throws Exception {
		session.insert(NS + ".addOrderDetail", vo);		
	}
	
	// 주문 정보 추가
	@Override
	public void addOrder(OrderVO vo) throws Exception {
		session.selectList(NS + ".addOrder", vo);  // 이름 다시
	}
	
	// 주문 목록
	@Override
	public List<OrderListVO> orderList(String mem_id) throws Exception {
		return session.selectList(NS + ".orderList", mem_id);
	}
	
	// 주문 상세 정보
	@Override
	public List<OrderReadDetailVO> readOrder(int ord_num) throws Exception {
		return session.selectList(NS + ".readOrder", ord_num);
	}
	
	// 주문자 정보
	@Override
	public OrderVO getOrder(int ord_num) throws Exception {
		return session.selectOne(NS + ".getOrder", ord_num);
	}

}
