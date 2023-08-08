package com.tr.join.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.board.model.vo.Board;

public interface BoardDao {
	//자유게시판
	List<Board> selectCommunityAll(SqlSession session,int no);
}
