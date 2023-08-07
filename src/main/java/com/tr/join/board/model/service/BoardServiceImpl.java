package com.tr.join.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.attendance.model.dao.AttendanceDao;
import com.tr.join.board.model.dao.BoardDao;
import com.tr.join.board.model.vo.Board;
@Service
public class BoardServiceImpl implements BoardService {
	
	private BoardDao dao;
	private SqlSession session;
	
	public BoardServiceImpl(BoardDao dao, SqlSession session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	//자유게시판 리스트
	@Override
	public List<Board> selectCommunityAll(int no) {
		return dao.selectCommunityAll(session,no);
	}
}
