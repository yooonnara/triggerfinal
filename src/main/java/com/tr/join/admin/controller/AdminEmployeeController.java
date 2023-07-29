package com.tr.join.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.tr.join.admin.model.service.AdminEmployeeService;

@Controller
public class AdminEmployeeController {
	
	@Autowired
	private AdminEmployeeService service;
	
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
	

}
