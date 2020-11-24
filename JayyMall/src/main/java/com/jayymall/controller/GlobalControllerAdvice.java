package com.jayymall.controller;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.jayymall.service.ProductService;

@ControllerAdvice(basePackages = {"com.jayymall.controller"})
public class GlobalControllerAdvice {
		
	@Inject
	private ProductService service;
	
	/* 1차 카테고리 메뉴 표시 */
	@ModelAttribute
	public void categoryList(Model model) throws Exception{
		model.addAttribute("userCategoryList", service.mainCGList());
		
		System.out.println("톰캣 서버 시작...");
	}
}
