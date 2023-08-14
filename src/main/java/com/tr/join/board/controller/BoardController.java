package com.tr.join.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tr.join.board.model.service.BoardService;
import com.tr.join.board.model.vo.Board;
import com.tr.join.board.model.vo.BoardComment;
import com.tr.join.board.model.vo.BoardImg;
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
		System.out.println(m);
		
		return "board/communityWrite";
	}
	
	
	//작성값 전송
	@RequestMapping("/board/insertCommunityWrite")
	public String insertCommunityWrite(Board b, MultipartFile[] upFile, HttpSession session,Model m) {
		if(upFile != null) {	
		for(MultipartFile mf : upFile) {
			if(!mf.isEmpty()) { 
				String path= session.getServletContext().getRealPath("/resources/upload/board/");
				String oriName = mf.getOriginalFilename();
				String ext = oriName.substring(oriName.lastIndexOf(".")); 
				Date today = new Date(System.currentTimeMillis());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS"); 
				int randomNum = (int)(Math.random()*1000)+1;
				String reName = sdf.format(today)+"_"+randomNum + ext;
				
				//파일 업로드
				try {
					mf.transferTo(new File(path + reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				BoardImg file = BoardImg.builder().fileName(oriName).saveFileName(reName).build();
				b.getFile().add(file);
				
			}
		}
	}
	try {
		service.insertCommunityWrite(b);
	}catch(RuntimeException e) {
		e.printStackTrace();
		m.addAttribute("msg","글쓰기 등록 실패!");
		m.addAttribute("loc", "/communityWrite");
		return "common/msg";
	}
	m.addAttribute("msg","글쓰기 등록 성공!");
		return "redirect:/community";
	}
	
	
	//상세보기
	@GetMapping("/board/communityView.do")
	public String selectCommunityById(int no, Model m) {
		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		m.addAttribute("loginNo", loginNo.getNo());
		m.addAttribute("board", service.selectCommunityById(no));
		m.addAttribute("comment", service.selectCommentAll(no));
		System.out.println(m);
		return "board/communityView";
	}
	
	//삭제
	@RequestMapping("/board/communityDelete.do")
	public String communityDelete(@RequestParam Map param, Model m) {
		int result = service.communityDelete(param);
		if(result > 0) {
			m.addAttribute("msg","게시물이 삭제 되었습니다.");
			m.addAttribute("loc", "/community");
			return "common/msg";
		}
		
		return "redirect:/community";
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
	public String communityModifySubmit(@RequestParam Map param, Model m) {
		System.out.println(param);
		int result = service.communityModifySubmit(param);
		
		if(result > 0) {
			m.addAttribute("msg","수정 완료!");
			m.addAttribute("loc", "/community");
			return "common/msg";
		}
		return "redirect:/community";
	}
	
	
	//댓글 작성
	@RequestMapping("/board/commentWrite")
	private String commentWrite(@RequestParam Map param, Model m) {
		
		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.put("loginNo", loginNo.getName());
		int result = service.commentWrite(param);
		System.out.println(param);
		List<BoardComment> comment = service.selectComment(param);
		m.addAttribute("result",result);
		m.addAttribute("comment",comment);
		
		return "board/communityView";
	}
	
	
//	@RequestMapping("/board/comment")
//	 
//	@ResponseBody private Map<String, Object> commentInsert(){
//	
//	Map<String,Object> cParam=new HashMap(); List<BoardComment> comment =
//	service.selectComment(); cParam.put("comment",comment);
//	
//	return cParam; }
	
	
	
}
