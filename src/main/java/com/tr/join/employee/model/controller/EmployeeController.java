package com.tr.join.employee.model.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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

	@GetMapping("/main") 
	 public String mainPage() { 
		return "mainpage"; 
	}
	
	// 마이페이지 정보 불러오기
	@GetMapping("/mypage")
	public String mypage(Model m){
		// 로그인한 현재 유저 정보 (세션에 저장)
		Employee loginEmp =(Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    m.addAttribute("empInfo",loginEmp);
	    
		return "mypage/mypage";
	}
	
	// 마이페이지 수정하기
	@PostMapping("/updateEmployee")
	public String updateEmployee(@RequestParam Map param) { 
		System.out.println(param);
		int result = service.updateEmployee(param);
		return "redirect:/mypage";
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/mypagePassword")
	public String mypagePassword(){
		// 로그인한 현재 유저 정보 (세션에 저장)
		Employee loginEmp =(Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    
		return "mypage/updatePassword";
	}
	
	// 비밀번호 수정하기
	@GetMapping("/updatePassword")
	public String updatePassword() { 
		return "redirect:/mypagePassword";
	}
		
	
	@GetMapping("/logout")
	public String logOut() {
		
		return "/";
	}
	
	
	

}
