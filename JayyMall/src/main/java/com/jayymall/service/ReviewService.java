package com.jayymall.service;

import java.util.List;

import com.jayymall.domain.ReviewVO;
import com.jayymall.util.Criteria;

public interface ReviewService {

	// 상품 후기 총 개수
	public int countReview(int product_num) throws Exception;
	
	// 상품 후기 쓰기
	public void writeReview(ReviewVO vo, String mem_id) throws Exception;
	
	// 상품 후기 리스트 (페이지 포함)
	public List<ReviewVO> listReview(int product_num, Criteria cri) throws Exception;
	
	// 상품 후기 삭제
	public void deleteReview(int rv_num) throws Exception;
	
	// 상품 후기 수정
	public void modifyReview(ReviewVO vo) throws Exception;
}
