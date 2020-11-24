package com.jayymall.service;

import java.util.List;
import java.util.Map;

import com.jayymall.domain.CategoryVO;
import com.jayymall.domain.ProductVO;
import com.jayymall.util.SearchCriteria;

public interface AdProductService {

	// 1차 카테고리 출력
	public List<CategoryVO> mainCGList() throws Exception;
	
	// 1차 카테고리에 따른 2차 카테고리
	public List<CategoryVO> subCGList(String cat_code) throws Exception;
	
	// 상품 등록
	public void insertProduct(ProductVO vo) throws Exception;
	
	// 상품 리스트
	public List<ProductVO> searchListProduct(SearchCriteria cri) throws Exception;
	
	// 검색 조건에 맞는 상품 개수
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	// 상품 정보
	public ProductVO readProduct(int product_num) throws Exception;
	
	// 상품 수정
	public void editProduct(ProductVO vo) throws Exception;
	
	// 상품 삭제
	public void deleteProduct(int product_num) throws Exception;
	
	// 선택한 상품 수정
	public void editChecked(Map<String, Object> map) throws Exception;
}
