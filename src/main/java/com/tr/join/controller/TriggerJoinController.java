package com.tr.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TriggerJoinController {

	@GetMapping("/")
	public String mainPage() {
		return "index";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "login/login";
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
