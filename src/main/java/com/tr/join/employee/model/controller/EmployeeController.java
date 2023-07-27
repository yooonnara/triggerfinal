package com.tr.join.employee.model.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@PostMapping("/login") 
	 public String mainPage() { 
		 return "mainpage"; 
	}
	 
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
	

}
