package com.tr.join.employee.model.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tr.join.employee.model.service.EmployeeService;
import com.tr.join.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	// 메소드로
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
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
		// 로그인한 현재 유저 session 정보 
		Employee loginEmp =(Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// session에 있는 ID로 user의 DB정보 select
		Employee emp = service.selectEmployeeById(loginEmp.getId()); // 현재 정보로 DB에서 select
	    m.addAttribute("empInfo",emp);
	    
		return "mypage/mypage";
	}
	
	// 마이페이지 수정하기
	@PostMapping("/updateEmployee")
	public String updateEmployee(@RequestParam Map param) { 
		int result = service.updateEmployee(param);
		return "redirect:/mypage";
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/mypagePassword")
	public String mypagePassword(){
	    
		return "mypage/updatePassword";
	}
	
	// 비밀번호 수정하기
	@PostMapping("/updatePassword")
	public String updatePassword(@RequestParam Map param) { 
		// 로그인한 현재 유저 정보 (세션에 저장된 정보)
		Employee sessionEmp = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.put("emp_id", sessionEmp.getId());
		
		String newPassword = (String)param.get("pwd1");
		newPassword = passwordEncoder.encode(newPassword);
		
		param.put("password", newPassword);
		
		int result = service.updatePassword(param);
		
		return "redirect:/mypagePassword";
	}
	
	// 현재 비밀번호와 입력한 비밀번호의 일치여부 확인
	@PostMapping("/ajax/checkPassword")
	@ResponseBody
	public int checkPassword(@RequestParam Map param) {
//		로그인한 현재 유저 정보 (세션에 저장된 정보)
		Employee sessionEmp = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// session에 있는 ID로 user의 DB정보 select
		Employee dbEmp = service.selectEmployeeById(sessionEmp.getId());
		
		// form input 현재 패스워드 => ajax로 전달된 패스워드
		String password = (String)param.get("password");
		
//		System.out.println("파라미터 입력해서 전달 받은 비밀번호는 " + password);
//		System.out.println("현재 세션에 저장된 비밀번호는 " + sessionEmp.getPassword());
//		System.out.println("디비에 저장된 비밀번호는 " + dbEmp.getPassword());
		
		if(password != null && passwordEncoder.matches(password, dbEmp.getPassword()) == true) {
			System.out.println("일치");
			return 1;
		} else {
			System.out.println("불일치");
			return 0;
		}
	}
	
	
	@GetMapping("/logout")
	public String logOut() {
		
		return "/";
	}
	
	
	

}
