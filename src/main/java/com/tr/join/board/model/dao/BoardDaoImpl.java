package com.tr.join.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.board.model.vo.Board;
import com.tr.join.board.model.vo.BoardComment;
import com.tr.join.board.model.vo.BoardImg;
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
	public int insertCommunityWrite(SqlSession session, Board b) {
		return session.insert("board.insertCommunityWrite",b);
	}

	@Override
	public int insertBoardImg(SqlSession session, BoardImg b) {
		return session.insert("board.insertBoardImg", b);
	}

	@Override
	public Board selectCommunityById(SqlSession session, int no) {
		return session.selectOne("board.selectCommunityById",no);
	}

	
	@Override
	public List<BoardComment> selectCommentAll(SqlSession session, int no) {
		return session.selectList("board.selectCommentAll",no);
	}

	@Override
	public Board communityModifyList(SqlSession session, Map<String, Object> param) {
		return session.selectOne("board.communityModifyList",param);
	}
	
	@Override
	public int communityDelete(SqlSession session, Map param) {
		return session.delete("board.communityDelete", param);
	}

	@Override
	public int communityModifySubmit(SqlSession session, Map param) {
		return session.insert("board.communityModifySubmit",param);
	}

	@Override
	public int commentWrite(SqlSession session, Map<String, Object> param) {
		return session.insert("board.commentWrite", param);
	}

	@Override
	public List<BoardComment> selectComment(SqlSession session,Map<String,Object> param) {
		return session.selectList("board.selectComment",param);
	}

	@Override
	public Board selectBoardAll(SqlSession session, Map<String, Object> param) {
		return session.selectOne("board.selectBoardAll",param);
	}
	
	
	
}
