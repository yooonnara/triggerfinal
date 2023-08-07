package com.tr.join.edms.model.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.edms.model.vo.Edms;

public interface EdmsDao {

	/*
	 * Employee selectEmployeeByno(SqlSession session, int no)
	 * 
	 * ;
	 */
		int insertbsn(SqlSession session, Edms e);
		
		List<Edms> selectBsnAll(SqlSession session, Map<String,Object> param);
		
		int selectEdmsCount(SqlSession session);
		
		
		/* 
		 * List<Edsm> selectEdsmAll(SqlSession session,Map<String,Object>param>); int
		 * selectEdsmByNo(SqlSession, int no);
		 */
		
		
		Edms selectByNo(SqlSession session, int no);
		
		int insertVc(SqlSession session, Edms d);
		
		List<Edms> selectVc(SqlSession session);
		
		
		//어드민계정 전체 화면 출력하기 
		
		List<Edms> adminBsnSelect(SqlSession session);
		
		Edms selectByBsnNo(SqlSession session, int no);
		
		List<Edms> searchEdmsByStatus(SqlSession session, Map<String,Object> ajaxParam);
		
		List<Edms> selectResearch(SqlSession session, Edms edms);
		
		
		//어드민 계정 연차 출력하기 
		List<Edms> adminVcSelect(SqlSession session);
		
		
		//어드민 계정 출장 승인하기 
		
		int updateAppStatus(SqlSession session, Map<String,Integer> ajaxNumber);


}