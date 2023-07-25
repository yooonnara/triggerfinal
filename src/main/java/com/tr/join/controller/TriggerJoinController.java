package com.tr.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TriggerJoinController {

	@GetMapping("/")
	public String mainPage() {
		return "login/login";
	}
	
	@PostMapping("/login")
	public String loginPage() {
		return "mainpage";
	}
	
	@GetMapping("/admin")
	public String adminPage() {
		return "admin/adminMain";
	}
	
	@GetMapping("/adminMember")
	public String adminMemberPage() {
		return "admin/adminMember";
	}
	
	@GetMapping("/mypage")
	public String mypagePage() {
		return "mypage/mypage";
	}
	
	
	
	
}
