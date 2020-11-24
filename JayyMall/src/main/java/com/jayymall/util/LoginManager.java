package com.jayymall.util;

import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class LoginManager implements HttpSessionBindingListener {

	// 해당 클래스를 싱글톤 패턴으로 구성
	private static LoginManager loginMng = null;
	
	// 클래스를 가져다 사용할 때 실수 안하도록 private으로 접근 막도록 하기 위해 사용
	private LoginManager() {}
	
	// 생성된 객체를 호출
	// 요청에 의한 모든 스레드들을 순차적으로 사용하기 위한 동기화 기능 메서드 : synchronized
	public static synchronized LoginManager getInstance() {
		if(loginMng == null) {
			loginMng = new LoginManager();
		}
		
		return loginMng;
		
	}
	
	// 로그인 시 사용자 아이디 저장
	private static Hashtable<HttpSession, String> loginUsers = new Hashtable<HttpSession, String>();
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		
		
	}
	 
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		
		
	}
}
