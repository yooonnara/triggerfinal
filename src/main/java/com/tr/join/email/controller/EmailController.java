package com.tr.join.email.controller;

import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tr.join.email.entity.EmailMessage;
import com.tr.join.email.model.service.EmailService;
import com.tr.join.employee.model.service.EmployeeService;
import com.tr.join.employee.model.vo.Employee;

@RequestMapping("/sendMail")
@RestController
public class EmailController {
	
	private EmailService emailService;
	private EmployeeService empService;
	
	public EmailController(EmailService emailService, EmployeeService empService) {
		super();
		this.emailService = emailService;                                               
		this.empService=empService;
	}
	
	// 회원가입 이메일 인증 - 요청 시 body로 인증번호 반환하도록 작성하였음
    @PostMapping("/passwordCheck")
    public String sendJoinMail(String id, HttpSession session) {
    	
    	Employee searchEmp=empService.selectEmployeeById(id);
    	System.out.println(searchEmp);
    	
        EmailMessage emailMessage = EmailMessage.builder()
                .to(searchEmp.getEmail())
                .subject("[JOIN OFFICE] 비밀번호 변경을 위한 인증코드")
                .build();
        System.out.println(searchEmp);
        try {
        	String authNum=emailService.sendMail(emailMessage);
        	session.setAttribute("authNum", authNum);
        }catch(RuntimeException e){
        	System.out.println("오류가 발생했습니다 : "+e.getMessage());
        	return "실패";
        }
        return "성공";
    
    }
    @PostMapping("/authNumcheck")
    public boolean authNumCheck(String authNum, HttpSession session) {
    	
    	if(Objects.equals(session.getAttribute("authNum"),authNum)) {
    		session.removeAttribute("authNum");
    		return true;
    	}
    	return false;
    }
    
   
    
}
