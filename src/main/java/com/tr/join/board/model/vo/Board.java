package com.tr.join.board.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tr.join.employee.model.vo.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	private int no; //커뮤니티 번호
	private String empNo; //사원번호
	private int type; //커뮤니티 타입 1-공지 2-자유게시판
	private String title; //제목
	private String content; //내용
	private int views; //조회수
	private String writer; //작성자
	private Date dateCreated; //작성일
	private Date dateModified; //수정일 
	private Date dateDeleted; //삭제일
	
	private Employee emp;
	private List<BoardImg> file = new ArrayList(); 
}
