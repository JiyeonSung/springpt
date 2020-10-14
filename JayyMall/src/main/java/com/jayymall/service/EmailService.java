package com.jayymall.service;

import com.jayymall.dto.EmailDTO;

public interface EmailService {

	public void sendMail(EmailDTO dto, String authcode);
}
