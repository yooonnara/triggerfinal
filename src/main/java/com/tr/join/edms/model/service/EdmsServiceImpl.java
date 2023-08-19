package com.tr.join.edms.model.service;

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.edms.model.dao.EdmsDao;
import com.tr.join.edms.model.vo.Attachment;
import com.tr.join.edms.model.vo.Edms;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
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
		
		log.info("실행전 : {}",e.getNo());
		int result=dao.insertbsn(session, e);
		log.info("실행후 : {}",e.getNo());
		if(result>0) {
			if(e.getFile().size()>0) {
				for(Attachment a : e.getFile()) {
					a.setEdmsNo(e.getNo());
					result+=dao.insertAttachment(session,a);
					//result=dao.insertAttachment(session,a);
					//if(result!=1) throw new RuntimeException("첨부파일의 내용이 이상합니다.");
				}
			}
		}
		//rollback처리를 원하다면..... RuntimeException을 발생시키면됨.
		if(result!=e.getFile().size()+1) throw new RuntimeException("첨부파일의 내용이 이상합니다.");
		//if(result!=0) throw new RuntimeException("첨부파일의 내용이 이상합니다.");
		
		
		return result;
	}
		//return dao.insertbsn(session, e);
//}
	
	//출장 조회하기
	
	@Override
	public List<Edms> selectBsnAll(Map<String,Object>param){
		return dao.selectBsnAll(session,param);
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
	public List<Edms> adminBsnSelect(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.adminBsnSelect(session,param);
	}
	
	
	
	
	

	
	@Override
	public int selectAdminCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectAdminCount(session,param);
	}

	//어드민 계정 출장 view로 상세 화면 출력하기 
	@Override
	public Edms selectByBsnNo(int no) {
		// TODO Auto-generated method stub
		return dao.selectByBsnNo(session,no);
	}

	//어드민 계정 ajax 이용하기 
	@Override
	public List<Edms> searchEdmsByStatus(Map<String,Object> ajaxParam,Map<String,Integer> page) {
		// TODO Auto-generated method stub
		return dao.searchEdmsByStatus(session, ajaxParam,page);
	}
	
	
	//어드민 계정 ajax 검색하기 
	@Override
	public List<Edms> search(Edms edms,Map<String,Integer> page){
		// TODO Auto-generated method stub
		return dao.selectResearch(session,edms,page);
	}
	
	

	@Override
	public int selectajCount(Map<String, Object> ajaxParam) {
		// TODO Auto-generated method stub
		return dao.selectajCount(session,ajaxParam);
	}
	
	
	


	@Override
	public List<Edms> vcEdmsByStatus(Map<String, Object> param) {
		
		return dao.vcEdmsByStatus(session,param);
	}


	@Override
	public int selectajaxCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectajaxCount(session,param);
	}
	
	//이용자 계정 ajax 검색하기 


	@Override
	public List<Edms> eSearch(Edms edms,Map<String,Integer> page) {
		// TODO Auto-generated method stub
		return dao.selecteSearch(session,edms,page);
	}

	
	
	

	@Override
	public int selectSearchCount(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.selectSearchCount(session,param);
	}

	
	

	@Override
	public int selectCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectSearchCount(session, param);
	}


	@Override
	public List<Edms> adminVcSelect(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.adminVcSelect(session, param);
	}


	@Override
	public int deleteEdms(Edms e) {
		// TODO Auto-generated method stub
		return dao.deleteEdms(session, e);
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


	//연차 페이지 ajax로 검색하기 
	@Override
	public List<Edms> searchVc(Edms edms) {
		// TODO Auto-generated method stub
		return dao.searchVc(session,edms);
	}
	
	
	
	
	
	

	
	
	
	
	
}