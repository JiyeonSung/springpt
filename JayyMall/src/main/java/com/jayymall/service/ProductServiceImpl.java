package com.jayymall.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jayymall.domain.CategoryVO;
import com.jayymall.domain.ProductVO;
import com.jayymall.persistence.ProductDAO;
import com.jayymall.util.SearchCriteria;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;
	
	// 1차 카테고리 출력
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return dao.mainCGList();
	}

	// 2차 카테고리 출력
	@Override
	public List<CategoryVO> subCGList(String cat_code) throws Exception {
		return dao.subCGList(cat_code);
	}

	// 카테고리 코드에 해당하는 카테고리 명
	@Override
	public String getCGName(String cat_code) throws Exception {
		return dao.getCGName(cat_code);
	}

	// 해당 카테고리에 해당하는 상품 리스트 (페이지에 맞춰서)
	@Override
	public List<ProductVO> productListCG(Map map) throws Exception {
		return dao.productListCG(map);
	}

	// 카테고리에 해당하는 상품 개수
	@Override
	public int productCount(String cat_code) throws Exception {
		return dao.productCount(cat_code);
	}
	
	// 해당 검색조건에 해당하는 상품리스트(페이지에 맞춰서)
	@Override
	public List<ProductVO> productListSearch(SearchCriteria cri) throws Exception {
		return dao.productListSearch(cri);
	}
	
	// 해당 검색조건에 해당하는  상품 개수
	@Override
	public int productCountSearch(String keyword) throws Exception {
		return dao.productCountSearch(keyword);
	}	

	// 상품 상세 정보 읽기
	@Override
	public ProductVO readProduct(int product_num) throws Exception {
		return dao.readProduct(product_num);
	}

	

}
