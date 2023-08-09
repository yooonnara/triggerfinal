package com.tr.join.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.board.model.vo.Board;
import com.tr.join.employee.model.vo.Employee;

public interface BoardDao {
	//자유게시판
	List<Board> selectCommunityAll(SqlSession session,Map<String,Object> param);
	int CommunityCount(SqlSession session);
	List<Employee> communityWrite(SqlSession session,int no);
	int insertCommunityWrite(SqlSession session, Map param);
	Board selectCommunityById(SqlSession session, int no);
	Board communityModifyList(SqlSession session, Map<String,Object> param);
	int communityModifySubmit(SqlSession session, Map param);
}
