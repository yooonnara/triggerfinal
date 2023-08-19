package com.tr.join.edms.model.service;



import java.util.List;
import java.util.Map;

import com.tr.join.edms.model.vo.Edms;

public interface EdmsService {

	//view 가져오기 
	/* Employee selectEmployeeByNo(int no); */
	
 int insertbsn(Edms e);
 
	/* List<Edsm> selectEdsmAll(Map<String,Object>param); */
 
 	List<Edms> selectBsnAll(Map<String,Object> param);

 	//List<Edms> selectPage(int cPage, int numPerpage);

 	Edms selectByNo(int no);
 	
 int insertVc(Edms d);
 
 List<Edms> selectVc();
 
 
 //어드민 계정 출장만 출력하기 
 List<Edms> adminBsnSelect(Map<String,Object> param);
 
 int selectAdminCount(Map<String,Object> param);
 
 //어드민 계정 출장 view 보여주기 
 Edms selectByBsnNo(int no);
 
 //어드민 계정 ajax 결재 검색하기 
 
 List<Edms> searchEdmsByStatus(Map<String,Object> ajaxParam,Map<String,Integer> page);
 
 List<Edms> search(Edms edms,Map<String,Integer> page);
 
 int selectajaxCount(Map<String,Object> param);
 
 //이용자 계정 ajax 출력하기, 페이징 처리 하기
 
 List<Edms> eSearch(Edms edms,Map<String,Integer> page);
 
 int selectSearchCount(Map<String,Object> param);
 
 int selectCount(Map<String,Object> param);
 int selectajCount(Map<String,Object> ajaxParam);
 
 
 //어드민 연차 검색하기 
 List<Edms> adminVcSelect(Map<String,Object> param);
 
 //어드민 승인하기 
 
 int updateAppStatus(Map<String,Integer> ajaxNumber);
 
 Edms selectByVcNo(int no);
 
 List<Edms> searchVc(Edms edms);

int deleteEdms(Edms e);

List<Edms> vcEdmsByStatus(Map<String, Object> param);
 
}
