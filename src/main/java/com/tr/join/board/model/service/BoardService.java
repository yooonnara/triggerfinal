package com.tr.join.board.model.service;

import java.util.List;
import java.util.Map;

import com.tr.join.board.model.vo.Board;
import com.tr.join.board.model.vo.BoardComment;
import com.tr.join.employee.model.vo.Employee;

public interface BoardService {
	//자유게시판 리스트
	List<Board> selectCommunityAll(Map<String,Object> param);
	int CommunityCount();
	List<Employee> communityWrite(int no);
	int insertCommunityWrite(Board b);
	Board selectCommunityById(int no);
	List<BoardComment> selectCommentAll(int no);
	Board communityModifyList(Map<String,Object> param);
	int communityDelete(Map param);
	int communityModifySubmit(Map param);
	int commentWrite(Map<String,Object> param);
	List<BoardComment> selectComment(Map<String,Object> param);
	Board selectBoardAll(Map<String,Object> param);
}
