package com.jayymall.service;

import java.util.List;

import com.jayymall.domain.MemberVO;
import com.jayymall.util.SearchCriteria;

public interface AdMemberService {

	// 회원 리스트
	public List<MemberVO> searchListMember(SearchCriteria cri) throws Exception;

	// 검색 조건에 맞는 상품 개수
	public int searchListCount(SearchCriteria cri) throws Exception;

	// 회원 삭제
	public void deleteMember(int mem_id) throws Exception;

}
