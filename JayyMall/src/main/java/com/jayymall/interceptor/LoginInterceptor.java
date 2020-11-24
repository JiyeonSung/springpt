package com.jayymall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 로그인 인터셉터 
 * /member/checkPw   http://localhost:8080/member/checkPw?url=modify
 */

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	private static final String LOGIN = "user";
	
	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		// 사용자가 요청한 방식이 GET방식이면
		if(req.getMethod().equals("GET")) {
			logger.info("dest: " + (uri + query));
			//원래요청한 주소저장
			req.getSession().setAttribute("dest", uri+query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		// 인증된 사용자가 아닌경우 로그인 페이지로 이동
		if(session.getAttribute(LOGIN) == null) {
			logger.info("인증이 안된 경우");
			System.out.println("인증안됨");
			
			saveDest(request); // 원래요청된 주소를 세션형태로 저장하는 메서드
			
			response.sendRedirect("/member/login");
			return false;
		}
		
		
		return true; // 요청된 주소의 해당 컨트롤러 메서드로 진행이 이루어진다.
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		logger.info("=====login PostHandler() execute...");
		return;
	}
	
}

