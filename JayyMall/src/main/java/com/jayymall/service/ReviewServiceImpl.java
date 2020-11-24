package com.jayymall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jayymall.domain.ReviewVO;
import com.jayymall.persistence.ReviewDAO;
import com.jayymall.util.Criteria;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	// 상품 후기 총 개수
	@Override
	public int countReview(int product_num) throws Exception {
		return dao.countReview(product_num);
	}

	// 상품 후기 쓰기
	@Override
	public void writeReview(ReviewVO vo, String mem_id) throws Exception {
		vo.setMem_id(mem_id);
		dao.writeReview(vo);

	}

	// 상품 후기 리스트 (페이지 포함)
	@Override
	public List<ReviewVO> listReview(int product_num, Criteria cri) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("product_num", product_num);
		map.put("cri", cri);
		
		return dao.listReview(map);
	}

	// 상품 후기 삭제
	@Override
	public void deleteReview(int rv_num) throws Exception {
		dao.deleteReview(rv_num);
	}

	// 상품 후기 수정
	@Override
	public void modifyReview(ReviewVO vo) throws Exception {
		dao.modifyReview(vo);
	}

}
