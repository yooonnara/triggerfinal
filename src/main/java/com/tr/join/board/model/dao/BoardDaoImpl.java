package com.tr.join.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.board.model.vo.Board;
import com.tr.join.employee.model.vo.Employee;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectCommunityAll(SqlSession session, Map<String,Object> param) {
		return session.selectList("board.selectCommunityAll", param);
	}

	@Override
	public int CommunityCount(SqlSession session) {
		return session.selectOne("board.CommunityCount");
	}

	@Override
	public List<Employee> communityWrite(SqlSession session, int no) {
		return session.selectList("board.communityWrite",no);
	}

	@Override
	public int insertCommunityWrite(SqlSession session, Map param) {
		return session.insert("board.insertCommunityWrite",param);
	}

	@Override
	public Board selectCommunityById(SqlSession session, int no) {
		return session.selectOne("board.selectCommunityById",no);
	}

	@Override
	public Board communityModifyList(SqlSession session, Map<String, Object> param) {
		return session.selectOne("board.communityModifyList",param);
	}

	@Override
	public int communityModifySubmit(SqlSession session, Map param) {
		return session.insert("board.communityModifySubmit",param);
	}
	
	
	
}
