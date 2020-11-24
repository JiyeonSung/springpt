package com.jayymall.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jayymall.domain.CategoryVO;
import com.jayymall.domain.ProductVO;
import com.jayymall.persistence.AdProductDAO;
import com.jayymall.util.SearchCriteria;

@Service
public class AdProductServiceImpl implements AdProductService {

	@Autowired
	AdProductDAO dao;
	
	// 1차 카테고리
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return dao.mainCGList();
	}

	// 1차 카테고리에 따른 2차 카테고리
	@Override
	public List<CategoryVO> subCGList(String cat_code) throws Exception {
		return dao.subCGList(cat_code);
	}

	// 상품 등록
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		dao.insertProduct(vo);
	}
	
	// 상품 리스트
	@Override
	public List<ProductVO> searchListProduct(SearchCriteria cri) throws Exception {
		return dao.searchListProduct(cri);
	}

	// 검색 조건에 맞는 상품 개수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}

	// 상품 정보
	@Override
	public ProductVO readProduct(int product_num) throws Exception {
		return dao.readProduct(product_num);
	}

	// 상품 수정
	@Override
	public void editProduct(ProductVO vo) throws Exception {
		dao.editProduct(vo);
	}

	// 상품 삭제
	@Override
	public void deleteProduct(int product_num) throws Exception {
		dao.deleteProduct(product_num);
	}

	// 선택한 상품 수정
	@Override
	public void editChecked(Map<String, Object> map) throws Exception {
		dao.editChecked(map);
	}
	
}
