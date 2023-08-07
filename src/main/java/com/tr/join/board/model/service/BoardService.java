package com.tr.join.board.model.service;

import java.util.List;
import java.util.Map;

import com.tr.join.board.model.vo.Board;

public interface BoardService {
	//자유게시판 리스트
	List<Board> selectCommunityAll(int no);
}
