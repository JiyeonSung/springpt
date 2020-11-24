package com.jayymall.service;

import com.jayymall.domain.AdminVO;
import com.jayymall.dto.AdminDTO;

public interface AdminService {

	// 로그인
	public AdminVO login(AdminDTO dto) throws Exception;
	
}
