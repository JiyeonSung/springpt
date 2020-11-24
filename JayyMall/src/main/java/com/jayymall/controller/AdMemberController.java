package com.jayymall.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jayymall.service.AdMemberService;
import com.jayymall.util.PageMaker;
import com.jayymall.util.SearchCriteria;

@Controller
@RequestMapping("/admin/member/*")
public class AdMemberController {
	
	@Autowired
	private AdMemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdMemberController.class);
	
	
	/* 
	 * 회원 리스트 (페이징, 검색 조건 포함)
	 * 
	 * # JSP로 전달
	 * 1. 검색 조건에 해당하는 회원리스트
	 * 2. PageMaker
	 */
	// url 이 처음 요청 받았을 경우  SearchCriteria cri 기본값을 가지게 됨. 
	// this.page = 1; // 현재 페이지 번호. this.perPageNum = 10; // 페이지에 출력 게시물 개수
	// searchType = null,  keyword = null
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void memberList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info("=====memberList() execute...");
		logger.info("=====cri : " + cri.toString());
		
		// 페이징 기능이 적용된 상품 데이터 (검색기능 포함 선택적)
		model.addAttribute("memberList", service.searchListMember(cri));
		
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
	
	
	/* 회원 삭제(POST) */
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String memberDeletePOST(SearchCriteria cri, 
									@RequestParam("mem_id") int mem_id, 
									RedirectAttributes rttr) throws Exception{
		logger.info("=====delete(POST) executed...");

		// 회원 삭제
		service.deleteMember(mem_id);
		rttr.addFlashAttribute("cri", cri);
		rttr.addFlashAttribute("msg", "DELETE_SUCCESS");
		// 시작했던 리스트 (선택한 페이지정보, 검색기능 사용)
		return "redirect:/admin/member/list";
	}
	
	
	/* 선택된 회원 삭제 */
	@ResponseBody
	@RequestMapping(value="deleteChecked", method=RequestMethod.POST)
	public ResponseEntity<String> deleteChecked(@RequestParam("checkArr[]") List<Integer> checkArr) {
		
		logger.info("===== deleteChecked() execute.....");
		
		ResponseEntity<String> entity = null;
		try {
			// 체크 된 회원의 회원을 삭제
			for(int i=0; i<checkArr.size(); i++) {
				service.deleteMember(checkArr.get(i));
			}
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
			
		} catch(Exception e){
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
	
}
