package com.tr.join.employee.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
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
