package com.tr.join.edsm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tr.join.edsm.model.dao.edsmService;
@RequestMapping("/edsm")
@Controller
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


