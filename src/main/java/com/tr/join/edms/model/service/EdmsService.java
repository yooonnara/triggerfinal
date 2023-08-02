package com.tr.join.edms.model.service;



import java.util.List;
import java.util.Map;

import com.tr.join.edms.model.vo.Edms;

public interface EdmsService {

	//view 가져오기 
	/* Employee selectEmployeeByNo(int no); */
	
 int insertbsn(Edms e);
 
	/* List<Edsm> selectEdsmAll(Map<String,Object>param); */
 
 	List<Edms> selectBsnAll(Map<String,Object>param);
 	
 	int selectEdmsCount();
 	
 	//List<Edms> selectPage(int cPage, int numPerpage);
 	
 	
 	Edms selectByNo(int no);
 	
 int insertVc(Edms d);
 
 List<Edms> selectVc();
 
 
}
