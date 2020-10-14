package com.jayymall.service;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.jayymall.dto.EmailDTO;

@Service
public class EmailServiceImpl implements EmailService {

	@Inject
	JavaMailSender mailSender;
	
	@Override
	public void sendMail(EmailDTO dto, String authcode) {
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			// 받는 사람 설정(이메일)
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
			// 보내는 사람 설정(이메일, 이름)
			msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			// 이메일 제목
			msg.setSubject(dto.getSubject(), "utf-8");
			// 이메일 본문(인증코드 추가)
			msg.setText(dto.getMessage() + authcode , "utf-8");
			
			// 메일 보내기
			mailSender.send(msg); // gamil 보안설정을 낮게 하지않으면, 자신의 지메일로 메세지를 받을수 있다.
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
