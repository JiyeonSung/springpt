package com.jayymall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jayymall.domain.OrderDetailVO;
import com.jayymall.domain.OrderDetailVOList;
import com.jayymall.domain.OrderListVO;
import com.jayymall.domain.OrderReadDetailVO;
import com.jayymall.domain.OrderVO;
import com.jayymall.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO dao;
	
	@Autowired
	private CartService cartService;
	
	/* 
	 * 상품구매(상품상세/ 바로구매)
	 * 주문내역과 주문정보 추가 
	 */

    // 사용자 1명이 여러건의 상품을 주문했을 때 
	// 메서드에서 2가지 이상의 기능이 사용될때. insert, update, delete 경우에 해당.
	@Transactional
	@Override
	public void addOrder(OrderVO order, OrderDetailVOList orderDetailList) throws Exception {
		
		// 시퀀스를 처리하는 방법 2가지
		
		// 시퀀스 (주문 코드) 가져오기 => 주문 정보, 주문 상세 정보에 동일한 주문 코드가 사용되어야 하기 때문.
		int ord_num = dao.readOrderCode();
		
		// 주문 정보 추가
		order.setOrd_num(ord_num);  // 주문 번호 할당
		dao.addOrder(order);  // 주문 테이블에 데이터 삽입
		
		// 주문 내역 추가. 주문 상세 테이블에 데이터 삽입.
		List<OrderDetailVO> list = orderDetailList.getOrderDetailList();
		
		// 주문 상세 건수만큼 반복 작업
		for(int i=0; i<list.size(); i++) {
			
			OrderDetailVO orderDetail = list.get(i);
			orderDetail.setOrd_num(ord_num);  // 주문 번호 할당
			dao.addOrderDetail(orderDetail);
		}

	}
	

	/* 
	 * 상품구매(장바구니)
	 * 주문내역과 주문정보 추가 
	 * 장바구니에서 넘어온 경우, 장바구니 테이블에서 해당 상품들 삭제
	 */
	@Transactional
	@Override
	public void addOrderCart(OrderVO order, OrderDetailVOList orderDetailList, String mem_id) throws Exception {
		
		// 시퀀스 (주문 코드) 가져오기
		int ord_num = dao.readOrderCode();
		
		// 주문 정보 추가
		order.setOrd_num(ord_num);
		
		// 1) 주문 정보 저장
		dao.addOrder(order);
		
		// 주문 내역 추가
		List<OrderDetailVO> list = orderDetailList.getOrderDetailList();
		for(int i=0; i<list.size(); i++) {
			
			OrderDetailVO orderDetail = list.get(i);
			orderDetail.setOrd_num(ord_num);
			
			// 주문 상세 정보 저장
			dao.addOrderDetail(orderDetail);
			
			// 장바구니 테이블에서 해당 상품들 삭제
			
			/* 
			 * 1) 구매 페이지에서 장바구니의 내역을 보여주고 진행이 된다면
			 * 장바구니 테이블에서 사옹자 아이디만 있으면 장바구니 테이블에서 자신의 상품 정보를 모두 삭제할 수 있다.
			 * (for문을 사용 안해도 된다.)
			 * 
			 * 2) 구매 페이지에서 체크박스에 의한 선택 기능이 포함된 장바구니의 내역을 보여주고 진행이 된다면
			 * 선택에 의하여 주문 결제를 한다.
			 */
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mem_id", mem_id);
			map.put("product_num", orderDetail.getProduct_num());
			
			// 장바구니 삭제 (바로구매와 다른 점)
			cartService.deleteCartOrder(map);  // 오타 에러
		}

	}

	// 주문 목록
	@Override
	public List<OrderListVO> orderList(String mem_id) throws Exception {
		return dao.orderList(mem_id);
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

}
