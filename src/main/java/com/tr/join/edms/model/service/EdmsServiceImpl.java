package com.tr.join.edms.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.edms.model.dao.EdmsDao;
import com.tr.join.edms.model.vo.Edms;
@Service
public class EdmsServiceImpl implements EdmsService {

		
	private EdmsDao dao;
		
	private SqlSession session;
	
	public EdmsServiceImpl(EdmsDao dao, SqlSession session) {
		this.dao=dao;
		this.session=session;
	}
	
	
	/*
	 * public EdsmServiceImpl(EdsmDao dao, SqlSession session) { this.dao= dao;
	 * this.session=session; }
	 */
	
	@Override
	public int insertbsn(Edms e) {
		return dao.insertbsn(session, e);
}
	
	//출장 조회하기
	
	@Override
	public List<Edms> selectBsnAll(Map<String,Object>param){
		return dao.selectBsnAll(session,param);
	}
	
	
	@Override
	public int selectEdmsCount() {
		return dao.selectEdmsCount(session);
	}
	
	//전체 view 페이지 보기 
	
	@Override
	public Edms selectByNo(int no) {
		return dao.selectByNo(session,no);
	}

	//출장 페이지 insert 하기 
	@Override
	public int insertVc(Edms d) {
		// TODO Auto-generated method stub
		return dao.insertVc(session,d);
	}

	//연차 페이지 출력하기 
	@Override
	public List<Edms> selectVc() {
		return dao.selectVc(session);
	}
	
	//어드민 출장만 출력하기 


	@Override
	public List<Edms> adminBsnSelect() {
		// TODO Auto-generated method stub
		return dao.adminBsnSelect(session);
	}
	
	//어드민 계정 출장 view로 상세 화면 출력하기 
	
	@Override
	public Edms selectByBsnNo(int no) {
		// TODO Auto-generated method stub
		return dao.selectByBsnNo(session,no);
	}

	//어드민 계정 ajax 이용하기 
	@Override
	public List<Edms> searchEdmsByStatus(Map<String,Object> ajaxParam) {
		// TODO Auto-generated method stub
		return dao.searchEdmsByStatus(session, ajaxParam);
	}
	
	
	//어드민 계정 ajax 검색하기 
	@Override
	public List<Edms> search(Edms edms){
		// TODO Auto-generated method stub
		return dao.selectResearch(session,edms);
	}


	@Override
	public List<Edms> adminVcSelect() {
		// TODO Auto-generated method stub
		return dao.adminVcSelect(session);
	}


	@Override
	public int updateAppStatus(Map<String, Integer> ajaxNumber) {
		// TODO Auto-generated method stub
		return dao.updateAppStatus(session,ajaxNumber);
	}


	

	//연차 페이지 view 출력하기 
	
	@Override
	public Edms selectByVcNo(int no) {
		// TODO Auto-generated method stub
		return dao.selectByVcNo(session,no);
	}
	
	
	
	
	

	
	
	
	
	
}