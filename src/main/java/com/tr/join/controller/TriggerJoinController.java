package com.tr.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TriggerJoinController {


	
	@GetMapping("/notice")
	public String noticePage() {
		return "board/notice";
	}
	
	
	
	
}
