package com.tr.join.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectCommunityAll(SqlSession session, int no) {
		return session.selectList("board.selectCommunityAll", no);
	}
	
}
