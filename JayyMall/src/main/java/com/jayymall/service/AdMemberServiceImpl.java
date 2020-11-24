package com.jayymall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jayymall.domain.MemberVO;
import com.jayymall.persistence.AdMemberDAO;
import com.jayymall.util.SearchCriteria;

@Service
public class AdMemberServiceImpl implements AdMemberService {

	@Autowired
	AdMemberDAO dao;
	
	// 회원 리스트
	@Override
	public List<MemberVO> searchListMember(SearchCriteria cri) throws Exception {
		return dao.searchListMember(cri);
	}

	// 검색 조건에 맞는 회원 수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}

	// 회원 삭제
	@Override
	public void deleteMember(int mem_id) throws Exception {
		dao.deleteMember(mem_id);
	}

}
