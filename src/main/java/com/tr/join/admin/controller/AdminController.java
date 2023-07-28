package com.tr.join.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	// 메인
	@GetMapping("/admin")
	public String adminPage() {
		return "admin/adminMain";
	}
	
	// 멤버 통합관리
	@GetMapping("/adminMember")
	public String adminMemberPage() {
		return "admin/adminMember";
	}
	
	//

}
