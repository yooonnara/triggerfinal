package com.tr.join.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.board.model.dao.BoardDao;
import com.tr.join.board.model.vo.Board;
import com.tr.join.employee.model.vo.Employee;
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
	public List<Board> selectCommunityAll(Map<String,Object> param) {
		return dao.selectCommunityAll(session,param);
	}

	@Override
	public int CommunityCount() {
		return dao.CommunityCount(session);
	}

	@Override
	public List<Employee> communityWrite(int no) {
		return dao.communityWrite(session,no);
	}

	@Override
	public int insertCommunityWrite(Map param) {
		return dao.insertCommunityWrite(session,param);
	}

	@Override
	public Board selectCommunityById(int no) {
		return dao.selectCommunityById(session,no);
	}

	@Override
	public Board communityModifyList(Map<String, Object> param) {
		return dao.communityModifyList(session, param);
	}

	@Override
	public int communityModifySubmit(Map param) {
		return dao.communityModifySubmit(session,param);
	}
	
	
	
}
