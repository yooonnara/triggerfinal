package com.tr.join.email.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.tr.join.email.entity.EmailMessage;
import com.tr.join.employee.model.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmailService {

    private final JavaMailSender javaMailSender;
    private final EmployeeService employeeService;

    
    public EmailService(JavaMailSender javaMailSender, EmployeeService employeeService) {
    	this.javaMailSender=javaMailSender;
    	this.employeeService=employeeService;
    }
    
    public String sendMail(EmailMessage emailMessage) {
        String authNum = createCode();

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();


        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
            mimeMessageHelper.setTo(emailMessage.getTo()); // 메일 수신자
            mimeMessageHelper.setSubject(emailMessage.getSubject()); // 메일 제목
            mimeMessageHelper.setText(sendContextMessage(authNum), true); // 메일 본문 내용, HTML 여부
            javaMailSender.send(mimeMessage);//메일을 전송하기

//            log.info("Success");

            return authNum;

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    // 인증번호 및 임시 비밀번호 생성 메서드
    private String createCode() {
        Random random = new Random();
        StringBuffer key = new StringBuffer();

        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(4);

            switch (index) {
                case 0: key.append((char) ((int) random.nextInt(26) + 97)); break;
                case 1: key.append((char) ((int) random.nextInt(26) + 65)); break;
                default: key.append(random.nextInt(9));
            }
        }
        return key.toString();
	}

	private String sendContextMessage(String msg) {
		return "<h2>인증코드 : " + msg + "</h2>";
    }
}