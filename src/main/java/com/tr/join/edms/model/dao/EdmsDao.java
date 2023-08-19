package com.tr.join.edms.model.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.edms.model.vo.Attachment;
import com.tr.join.edms.model.vo.Edms;

public interface EdmsDao {

	/*
	 * Employee selectEmployeeByno(SqlSession session, int no)
	 * 
	 * ;
	 */
		int insertbsn(SqlSession session, Edms e);
		int insertAttachment(SqlSession session, Attachment a);
		
		List<Edms> selectBsnAll(SqlSession session, Map<String,Object> param);
		
		
		
		
		/* 
		 * List<Edsm> selectEdsmAll(SqlSession session,Map<String,Object>param>); int
		 * selectEdsmByNo(SqlSession, int no);
		 */
		
		
		Edms selectByNo(SqlSession session, int no);
		
		int insertVc(SqlSession session, Edms d);
		
		List<Edms> selectVc(SqlSession session);
		
		int selectajCount(SqlSession session, Map<String,Object> ajaxParam);
		//어드민계정 전체 화면 출력하기 
		
		List<Edms> adminBsnSelect(SqlSession session,Map<String,Object> param);
		
		List<Edms> vcEdmsByStatus(SqlSession session,Map<String,Object> param);
		
		int selectAdminCount(SqlSession session, Map<String,Object> param);
		
		Edms selectByBsnNo(SqlSession session, int no);
		
		List<Edms> searchEdmsByStatus(SqlSession session, Map<String,Object> ajaxParam,Map<String,Integer> page);
		
		List<Edms> selectResearch(SqlSession session, Edms edms,Map<String,Integer> page);
		
		int selectajaxCount(SqlSession session,Map<String,Object> param );
		
		
		//어드민 계정 연차 출력하기 
		List<Edms> adminVcSelect(SqlSession session, Map<String,Object> param);
		//어드민 계정 상세 view 출력하기 
		
		Edms selectByVcNo(SqlSession session, int no);
		
		//어드민 계정 연차 ajax로 검색하기 
		List<Edms> searchVc(SqlSession session, Edms edms);
		
		//이용자 계정 ajax 검색하기 
		List<Edms> selecteSearch(SqlSession session, Edms edms,Map<String,Integer> page);
		
		//ajax 페이징 처리 하기 
		
		int selectSearchCount(SqlSession session,Map<String,Object> param);
		
		int selectCount (SqlSession session, Map<String,Object> param);
		
		//어드민 계정 출장 승인하기 
		
		int updateAppStatus(SqlSession session, Map<String,Integer> ajaxNumber);
		
		int deleteEdms(SqlSession session, Edms e);
		


}