package com.jayymall.persistence;

import java.util.List;

import com.jayymall.domain.MemberVO;
import com.jayymall.util.SearchCriteria;

public interface AdMemberDAO {

	// 회원 리스트
	public List<MemberVO> searchListMember(SearchCriteria cri) throws Exception;

	// 검색조건에 해당하는 회원 수
	public int searchListCount(SearchCriteria cri) throws Exception;

	// 회원 삭제
	public void deleteMember(int mem_id) throws Exception;
	
}
