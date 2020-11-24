package com.jayymall.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jayymall.domain.MemberVO;
import com.jayymall.util.SearchCriteria;

@Repository
public class AdMemberDAOImpl implements AdMemberDAO {

	@Autowired
	SqlSession session; 
	public final static String NS = "com.jayymall.mappers.AdMemberMapper";
	
	// 회원 리스트
	@Override
	public List<MemberVO> searchListMember(SearchCriteria cri) throws Exception {
		return session.selectList(NS+ ".searchListMember", cri);
	}

	// 검색 조건에 맞는 회원 수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return session.selectOne(NS+ ".searchListCount", cri);
	}

	// 회원 삭제
	@Override
	public void deleteMember(int mem_id) throws Exception {
		session.delete(NS+ ".deleteMember", mem_id);
	}

}
