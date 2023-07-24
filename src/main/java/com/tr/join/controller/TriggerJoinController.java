package com.tr.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TriggerJoinController {

	@GetMapping("/")
	public String mainpage() {
		return "index";
	}
	
}
