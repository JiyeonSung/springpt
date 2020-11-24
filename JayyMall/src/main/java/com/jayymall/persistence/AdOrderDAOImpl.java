package com.jayymall.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jayymall.domain.AdOrderDetailVO;
import com.jayymall.domain.OrderReadDetailVO;
import com.jayymall.domain.OrderVO;
import com.jayymall.util.SearchCriteria;

@Repository
public class AdOrderDAOImpl implements AdOrderDAO {

	@Autowired
	SqlSession session;
	public final static String NS = "com.jayymall.mappers.adOrderMapper";
	
	// 주문 리스트
	@Override
	public List<OrderVO> searchListOrder(SearchCriteria cri) throws Exception {
		return session.selectList(NS+ ".searchListOrder", cri);
	}

	// 검색 조건에 맞는 주문 개수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return session.selectOne(NS+ ".searchListCount", cri);
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
	
	// 주문 삭제
	@Override
	public void deleteOrder(int ord_num) throws Exception {
		session.delete(NS+ ".deleteOrder", ord_num);
	}

	// 주문 상세
	@Override
	public List<AdOrderDetailVO> orderDetail(int ord_num) throws Exception {
		return session.selectList(NS + ".orderDetail", ord_num);
	}
	
}
