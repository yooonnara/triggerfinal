package com.tr.join.employee.model.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tr.join.employee.model.service.EmployeeService;
import com.tr.join.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@GetMapping("/")
	public String loginPage() {
		return "login/login";
	}

	@GetMapping("/main") 
	 public String mainPage() { 
		 return "mainpage"; 
	}
	 
	@GetMapping("/mypage")
	public String mypage(Model m){
		// 로그인한 현재 유저 정보 (세션에 저장)
		Employee loginEmp =(Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
	    m.addAttribute("empInfo",loginEmp);
		return "mypage/mypage";
	}
	
	@GetMapping("/logout")
	public String logOut() {
		
		return "/";
	}
	
	
	
	

}
