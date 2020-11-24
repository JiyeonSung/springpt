package com.jayymall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jayymall.domain.CategoryVO;
import com.jayymall.domain.ProductVO;
import com.jayymall.service.ProductService;
import com.jayymall.service.ReviewService;
import com.jayymall.util.Criteria;
import com.jayymall.util.FileUtils;
import com.jayymall.util.PageMaker;
import com.jayymall.util.SearchCriteria;


@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Inject
	ProductService service;
	
	@Inject
	ReviewService reviewService;
	
	// 웹 프로젝트 영역 외부에 파일을 저장할 때 사용할 경로
	@Resource(name = "uploadPath")
	private String uploadPath;  // servlet-context.xml에 설정
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	/* 
	 * 1차 카테고리에 따른 2차 카테고리 출력
	 * 
	 * @Params
	 * 	@PathVariable("cat_code")
	 * 	: path로 들어온 1차카테고리
	 * 
	 * @return ResponseEntity<List<CategoryVO>>
	 * 	: REST 방식에 따른 HttpStatus를 같이 보내주기 위함
	 */
	@ResponseBody
	@RequestMapping(value="subCateList/{cat_code}", method=RequestMethod.GET)
	public ResponseEntity<List<CategoryVO>> subCGListPOST(@PathVariable("cat_code") String cat_code){
		
		logger.info("===== subCGListGET() execute.....");
		
		// 2차 카테고리 리스트
		ResponseEntity<List<CategoryVO>> entity = null;
		try {
			logger.info("====="+ service.subCGList(cat_code));
			entity = new ResponseEntity<List<CategoryVO>>(service.subCGList(cat_code), HttpStatus.OK);
		} catch(Exception e){
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
	
	/* 2차 카테고리에 해당하는 상품 리스트 출력 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") Criteria cri,
					 @ModelAttribute("cat_code") String cat_code,
					 Model model) throws Exception{
		
		logger.info("====list() executed...");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cat_code", cat_code);
		
		// 페이징 정보
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		// 카테고리에 해당하는 상품 리스트
		List<ProductVO> list = service.productListCG(map);
		model.addAttribute("productList", list);
		
		// 카테고리 이름
		model.addAttribute("cat_name", service.getCGName(cat_code));
		
		// PageMaker 생성
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		int count = service.productCount(cat_code);
		pm.setTotalCount(count);
		
		model.addAttribute("pm", pm);		
		
	}
	
	/* 검색조건에 해당하는 상품 리스트 출력 */
	@RequestMapping(value="listSearch", method=RequestMethod.GET)
	public void listSearch(@ModelAttribute("scri") SearchCriteria scri, 
					 		Model model) throws Exception{
		
		logger.info("=====listSearch() executed...");
		logger.info("=====cri: "+ scri.toString());
		
		List<ProductVO> list = service.productListSearch(scri);
		model.addAttribute("productList", list);
		
		// PageMaker 생성
		PageMaker pm = new PageMaker();
		pm.setCri(scri);
		int count = service.productCountSearch(scri.getKeyword());
		pm.setTotalCount(count);
		
		model.addAttribute("pm", pm);
	}
	
	/* 
	 * 파일 출력
	 * 저장된 파일을 가져와 반환
	 */
	@ResponseBody
	@RequestMapping(value = "displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath, fileName);
	}
	
	/* 
	 * 카테고리 선택 -> 상품 상세정보 페이지 읽기 
	 * Criteria를 매개변수로 받는다
	 */
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void productReadGET(@ModelAttribute("cri") Criteria cri,
							   @RequestParam("product_num") int product_num, Model model) throws Exception {
		
		logger.info("=====productReadGET() execute...");
		
		// 선택한 상품 정보의 이미지를 썸네일에서 원본으로 변경
		ProductVO vo = service.readProduct(product_num);
		// 이미지 사용  1) 리스트: 썸네일 이미지  2) 상세페이지: 원본(기본) 이미지
		vo.setProduct_img(FileUtils.thumbToOriginName(vo.getProduct_img()));
		
		//logger.info("=====dateFormat: " + DateFormatUtils.kstToDate(vo.getPdt_date_sub()).toString());
		logger.info("=====Product Detail: "+ vo.toString());
		model.addAttribute("vo", vo);  // 상품 정보
		
		// PageMaker 생성 - 상세페이지에서 -> 상품목록으로 돌아가기 클릭 시 이동하기 위해서 사용
		PageMaker pm = new PageMaker();
		pm.setCri(cri);  // Criteria : page, perPageNum -> rowStart, rowEnd
		
		model.addAttribute("pm", pm);  // 페이징 정보 사용, 검색정보 사용 안함. makeQuery() 메서드 사용
		
		// 해당 상품에 달린 상품 후기 개수를 함께 보냄
		model.addAttribute("totalReview", reviewService.countReview(vo.getProduct_num()));
	}
	
	/* 
	 * 검색리스트 -> 상품 상세정보 페이지 읽기
	 * SearchCriteria를 매개변수로 받는다
	 */
	@RequestMapping(value="readSearch", method=RequestMethod.GET)
	public void productReadSearch(@ModelAttribute("scri") SearchCriteria scri, 
								  @RequestParam("product_num") int product_num, Model model) throws Exception{
		
		logger.info("=====productReadGET() execute...");
		
		// 선택한 상품 정보의 이미지를 썸네일에서 원본으로 변경
		ProductVO vo = service.readProduct(product_num);
		vo.setProduct_img(FileUtils.thumbToOriginName(vo.getProduct_img()));
		
		//logger.info("=====dateFormat: " + DateFormatUtils.kstToDate(vo.getPdt_date_sub()).toString());
		logger.info("=====Product Detail: "+ vo.toString());
		model.addAttribute("vo", vo);  // 상품 정보
		
		// PageMaker 생성 - 상품목록으로 돌아가기 클릭 시 이동하기 위해서 사용
		PageMaker pm = new PageMaker();
		pm.setCri(scri);  // Criteria: page, perPageNum -> rowStart, rowEnd
		
		model.addAttribute("pm", pm);  // 페이징 정보 사용, 검색정보 사용 안함. makeQuery() 메서드 사용
		
		// 해당 상품에 달린 상품 후기 개수를 함께 보냄
		model.addAttribute("totalReview", reviewService.countReview(vo.getProduct_num()));
		
		// 방법1: 현재소스 - 상품후기 정보 없음. 클라이언트 코드쪽에서 ajax 요청에 의하여 처리가 되어짐.
		// 방법2: 처음부터 상품후기 정보를 DB에서 작업하여 Model로 가져온다.
	}
	
}
