package com.jayymall.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jayymall.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession session;
	public final static String NS = "com.jayymall.mappers.ReviewMapper";
	
	
	// 상품 후기 총 개수
	@Override
	public int countReview(int product_num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NS + ".countReview", product_num);
	}

	// 상품 후기 쓰기
	@Override
	public void writeReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NS + ".writeReview", vo);
	}

	// 상품 후기 리스트 (페이지 포함)
	@Override
	public List<ReviewVO> listReview(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NS + ".listReview", map);
	}

	// 상품 후기 삭제
	@Override
	public void deleteReview(int rv_num) throws Exception {
		// TODO Auto-generated method stub
		session.delete(NS + ".deleteReview", rv_num);
	}

	// 상품 후기 수정
	@Override
	public void modifyReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(NS + ".modifyReview", vo);
	}

}
