package com.tr.join.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tr.join.board.model.service.BoardService;
import com.tr.join.board.model.vo.Board;
import com.tr.join.common.PageFactory;
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
	public String selectCommunityAll(
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="8") int numPerpage,				
			Model m) {
		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		
		List<Board> board = service.selectCommunityAll(Map.of("loginNo",loginNo.getNo(),"cPage",cPage,"numPerpage",numPerpage));
		int totalData = service.CommunityCount();
		
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "/community"));
		m.addAttribute("totalData",totalData);
		m.addAttribute("board",board);
		
		System.out.println(board);
		
		return "board/community";
	}
	

	
	//자유게시판 작성페이지
	@GetMapping("/communityWrite")
	public String communityWrite(Model m) {
		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Employee> emp = service.communityWrite(loginNo.getNo());
		m.addAttribute("emp",emp);
		return "board/communityWrite";
	}
	//작성값 전송
	@RequestMapping("/board/insertCommunityWrite")
	public String insertCommunityWrite(@RequestParam Map param) {
		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.put("loginNo",loginNo.getNo());
		int result = service.insertCommunityWrite(param);
		//System.out.println(param);
		return "redirect:/community";
	}
	
	//상세보기
	@GetMapping("/board/communityView.do")
	public String selectCommunityById(int no, Model m) {
		m.addAttribute("board", service.selectCommunityById(no));
		return "board/communityView";
	}
	
	
	//수정
	@RequestMapping("/board/communityModify.do")
	public String communityModify(@RequestParam Map param, Model m) {
		//int no 넘어옴
		m.addAttribute("board", service.communityModifyList(param));
		
		System.out.println(m);
		return "board/communityModify";
	}
	
	@RequestMapping("/board/communityModifySubmit")
	public String communityModifySubmit(@RequestParam Map param) {
		System.out.println(param);
		int result = service.communityModifySubmit(param);
		
//		if(result > 0) {
//			"수정"
//		}
		return "redirect:/community";
	}
	
	
	
	
	
	
}
