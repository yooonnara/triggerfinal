package com.tr.join.email.controller;

import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @PostMapping("/idCheck")
    public String sendJoinMail(@RequestParam String id, HttpSession session) {
       
		Employee searchEmp = empService.selectEmployeeById(id);

		EmailMessage emailMessage = EmailMessage.builder().to(searchEmp.getEmail())
				.subject("[JOIN OFFICE] 비밀번호 변경을 위한 인증코드").build();
		try {
			String authNum = emailService.sendMail(emailMessage);
			session.setAttribute("authNum", authNum);
		} catch (RuntimeException e) {
			return "실패";
		}
		return "성공";
	}

    @PostMapping("/authNumcheck")
    public int authNumCheck(@RequestParam String authNum, HttpSession session) {
        String storedAuthNum = (String) session.getAttribute("authNum");
//      if (storedAuthNum != null && storedAuthNum.equals(authNum))
        if (Objects.equals(session.getAttribute("authNum"),authNum)) {
            session.removeAttribute("authNum");
            return 1;
        }
        return 0;
    }
    
    @PostMapping("/changePassword")
    public int changePassword(@RequestParam Map param) {
        String id = (String) param.get("id");
        String password = (String) param.get("password");
        System.out.println("전달 받은 emp id  : "+id);
        System.out.println("전달 받은 new pw  : "+password);
        // id 와 password 새로 저장하는 건 마이페이지 패스워드 쪽에서 시큐리티 관련 내용 복사해서 써야함
        if(true){ // 성공 시 1 이 조건을 수정해야함!!
        	
        }
        return 0; // 실패 시 0
    }
    
 }