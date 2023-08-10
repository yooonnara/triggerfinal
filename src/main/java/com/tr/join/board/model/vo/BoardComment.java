package com.tr.join.board.model.vo;

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
public class BoardComment {
	private int commentNo; //번호
	private int refNo; //댓글이 달리는 게시물 번호 
	private String content; //댓글 내용 
	private String writer; //작성자
	private Date createDate; //작성 날짜
	private String status; //삭제여부 y/n
	
	private Employee emp;
	private Board board;
}
