package com.tr.join.edsm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.tr.join.edsm.model.service.edsmService;
import com.tr.join.employee.model.vo.Employee;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("/edsm")
@Controller
@Slf4j
public class edsmController {
	
	@Autowired
	private edsmService service;
	
	@Autowired
	public edsmController(edsmService service) {
		this.service=service;
	}
	
	@RequestMapping("/bsnRequest")
	public String selectEmployeeByNo(Model m, int no) {
//	m.addAttribute("edsm",service.selectEmployeeByNo(no));
	return "edsm/bsnRequest";
	}
	
	@PostMapping("/bsnRequest")
	public String insertEmployee(Employee e) {
		int result = service.insertEmployee(e);
		if(result==0) {
			return "common/msg";
		}
		return "redirect:/edsm/bsnView";
	}
	

		@GetMapping("/adminVc")
		public String adminVcPage() {
			return "admin/adminVc";
		}
		@GetMapping("/vcRequest")
		public String edsmVcPage() {
			return "edsm/vcRequest";
		}
		@GetMapping("/bsnRequest")
		public String bsnRequestPage() {
			return "edsm/bsnRequest";
		}
		
	
		
		
}


