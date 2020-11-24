package com.jayymall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jayymall.domain.AdOrderDetailVO;
import com.jayymall.service.AdOrderService;
import com.jayymall.util.FileUtils;
import com.jayymall.util.PageMaker;
import com.jayymall.util.SearchCriteria;

@Controller
@RequestMapping("/admin/order/*")
public class AdOrderController {
	
	@Autowired
	private AdOrderService service;
	
	// 웹 프로젝트 영역 외부에 파일을 저장할 때 사용할 경로
	@Resource(name = "uploadPath")
	private String uploadPath;  // servlet-context.xml에 설정
	
	private static final Logger logger = LoggerFactory.getLogger(AdOrderController.class);

	
	/* 
	 * 상품 리스트 (페이징, 검색 조건 포함)
	 * 
	 * # JSP로 전달
	 * 1. 검색 조건에 해당하는 상품리스트
	 * 2. PageMaker
	 */
	// url 이 처음 요청 받았을 경우  SearchCriteria cri 기본값을 가지게 됨. 
	// this.page = 1; // 현재 페이지 번호. this.perPageNum = 10; // 페이지에 출력 게시물 개수
	// searchType = null,  keyword = null
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void orderList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info("=====orderList() execute...");
		logger.info("=====cri : " + cri.toString());
		
		// 페이징 기능이 적용된 상품 데이터 (검색기능 포함 선택적)
		model.addAttribute("orderList", service.searchListOrder(cri));
		
		// PageMaker 생성
		PageMaker pm = new PageMaker();
		pm.setCri(cri);  /// 페이징정보 (page=1, perPageNum=10), 검색정보(searchType=null, keyword=null)
		
		// 테이블에 전체 데이터 개수 (조건식 선택적 포함)
		int count = service.searchListCount(cri);
		
		logger.info("=====일치하는 상품 개수 : " + count);
		pm.setTotalCount(count);
		
		// 리스트 페이지에 1 2 3 4 5 링크 기능까지 작업할 수 있는 정보 pm 객체를 생성
		model.addAttribute("pm", pm);
	}
	
	
	/* 주문 삭제(POST) */
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String orderDeletePOST(SearchCriteria cri, 
									@RequestParam("ord_num") int ord_num, 
									RedirectAttributes rttr) throws Exception{
		logger.info("=====delete(POST) executed...");

		// 주문 삭제
		service.deleteOrder(ord_num);
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("msg", "DELETE_SUCCESS");
		// 시작했던 리스트 (선택한 페이지정보, 검색기능 사용)
		return "redirect:/admin/order/list";
	}
	
	
	/* 선택된 주문 삭제 */
	@ResponseBody
	@RequestMapping(value="deleteChecked", method=RequestMethod.POST)
	public ResponseEntity<String> deleteChecked(@RequestParam("checkArr[]") List<Integer> checkArr) {
		
		logger.info("===== deleteChecked() execute.....");
		
		ResponseEntity<String> entity = null;
		try {
			// 체크 된 주문의 주문을 삭제
			for(int i=0; i<checkArr.size(); i++) {
				service.deleteOrder(checkArr.get(i));
			}
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
			
		} catch(Exception e){
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}

	
	/*
	 * 주문 상세 조회(GET)
	 */
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void readGET(int ord_num, Model model, HttpSession session) throws Exception {
		
		logger.info("=====readGET() execute...");
		
		model.addAttribute("orderList", service.readOrder(ord_num));
		model.addAttribute("order", service.getOrder(ord_num));
	}
	
	
	/* 주문번호 클릭 시 상세보기 */
	@ResponseBody
	@RequestMapping(value = "/orderdetail/{ord_num}", method = RequestMethod.GET)
	public ResponseEntity<List<AdOrderDetailVO>> orderDetailPOST(@PathVariable("ord_num") int ord_num) throws Exception{
			//@PathVariable("ord_num") Integer ord_num) {
		
		logger.info("=====orderDetail() execute..." + service.orderDetail(ord_num));
		
		ResponseEntity<List<AdOrderDetailVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<AdOrderDetailVO>>(service.orderDetail(ord_num), HttpStatus.OK);
		} catch(Exception e){
			entity = new ResponseEntity<List<AdOrderDetailVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
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
	
	/* 이미지 파일 삭제 */
	public void deleteFile(String fileName) {
		logger.info("delete FileName : " + fileName);
		
		FileUtils.deleteFile(uploadPath, fileName);
	}
	
}
