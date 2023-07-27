package com.tr.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TriggerJoinController {


	@PostMapping("/login")
	public String loginPage() {
		return "mainpage";
	}
	
	@GetMapping("/mypage")
	public String mypagePage() {
		return "mypage/mypage";
	}
	
	@GetMapping("/notice")
	public String noticePage() {
		return "board/notice";
	}
	
	
	
	
}
