package com.jayymall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jayymall.domain.ReviewVO;
import com.jayymall.dto.MemberDTO;
import com.jayymall.service.ReviewService;
import com.jayymall.util.Criteria;
import com.jayymall.util.PageMaker;


@Controller
@RequestMapping(value = "/review/*")
public class ReviewController {
	
	@Inject
	private ReviewService service;
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	/* 상품 후기 쓰기 */
	@ResponseBody  // ajax로 요청 받을 때
	@RequestMapping(value="write", method=RequestMethod.POST)
	public void write(ReviewVO vo, HttpSession session) throws Exception {
		
		logger.info("=====writePOST() execute...");
		logger.info("=====vo: "+vo.toString());
		
		MemberDTO dto = (MemberDTO)session.getAttribute("user");
		
		service.writeReview(vo, dto.getMem_id());
	}
	
	
	/* 상품 후기 수정 */
	@ResponseBody
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public ResponseEntity<String> modify(ReviewVO vo){
		logger.info("=====modify() execute...");
		logger.info("=====vo: " + vo.toString());
		
		ResponseEntity<String> entity = null;
		
		try {
			service.modifyReview(vo);
			entity = new ResponseEntity<String>(HttpStatus.OK);
			
		} catch(Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity; 
	}
	
	
	/* 상품 후기 삭제 */
	@ResponseBody
	@RequestMapping(value = "{rv_num}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rv_num") int rv_num){
		logger.info("=====delete() execute...");
		
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteReview(rv_num);
			entity = new ResponseEntity<String>(HttpStatus.OK);
			
		} catch(Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	
	/* 상품 후기 리스트 (페이지 포함) */
	@ResponseBody
	@RequestMapping(value = "{product_num}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listReview(
			@PathVariable("product_num") Integer product_num,
			@PathVariable("page") Integer page) {
		
		logger.info("=====listReview() execute...");
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			// 작업 1) 상품 후기 리스트 모델작업
			// 상품 후기 리스트 VO
			List<ReviewVO> list = service.listReview(product_num, cri);
			
			// 후기 목록(페이지 포함) 추가 - 1개
			map.put("list", list);
			
			// 작업 2) PageMaker 객체 모델 작업
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			// 총 후기 개수 설정
			int replyCount = service.countReview(product_num);

			pageMaker.setTotalCount(replyCount);
			
			// 하단 페이지 작업 추가. Map - 1개
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}

