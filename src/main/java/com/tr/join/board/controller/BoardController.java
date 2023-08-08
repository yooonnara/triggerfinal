package com.tr.join.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tr.join.board.model.service.BoardService;
import com.tr.join.board.model.vo.Board;
import com.tr.join.employee.model.vo.Employee;

@Controller
public class BoardController {
	
	private BoardService service;
	public BoardController(BoardService service) {
		this.service=service;
	}
	
	
	@GetMapping("/notice")
	public String noticePage() {
		return "board/notice";
	}
	
	@GetMapping("/noticeWrite")
	public String noticeWritePage() {
		return "board/noticeWrite";
	}
	
	//자유게시판
	@GetMapping("/community")
	public String selectCommunityAll(Model m) {
		
		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		List<Board> board = service.selectCommunityAll(loginNo.getNo());
		m.addAttribute("board",board);
		System.out.println(m);
		
		return "board/community";
	}
	
	
}
