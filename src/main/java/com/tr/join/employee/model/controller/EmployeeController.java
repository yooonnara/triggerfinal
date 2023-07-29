package com.tr.join.employee.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String mypage(){
		return "mypage/mypage";
	}
	
	
	
	
//	public String selectEmployeeByNo(Model m) {
//	      Employee loginEmp=(Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//	      m.addAttribute("empInfo",service.selectEmployeeByNo(loginEmp.getNo()));
//	      return "mypage/mypage";
//	}
	
	

}
