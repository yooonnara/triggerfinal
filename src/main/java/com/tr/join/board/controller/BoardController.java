package com.tr.join.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	@GetMapping("/notice")
	public String noticePage() {
		return "board/notice";
	}
	
	@GetMapping("/noticeWrite")
	public String noticeWritePage() {
		return "board/noticeWrite";
	}
	
}
