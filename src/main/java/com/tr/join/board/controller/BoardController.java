package com.tr.join.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tr.join.board.model.service.BoardService;
import com.tr.join.board.model.vo.Board;
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
			if(!mf.isEmpty()) { //첨부파일이 있으면
				String path= session.getServletContext().getRealPath("/resources/upload/board/");
				String oriName = mf.getOriginalFilename(); //원본 이름 -> 지정 이름
				String ext = oriName.substring(oriName.lastIndexOf(".")); //.jpeg 뒷부분 가져온다
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
				
				//원래이름 및 저장이름 저장
				BoardImg file = BoardImg.builder().fileName(oriName).saveFileName(reName).build();
				b.getFile().add(file);
			}
		}
	}
	try {
		//System.out.println(b.getFile().size());
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
		System.out.println(m);
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
	
	
	
	
	
	
}
