package com.tr.join.edms.model.service;



import java.util.List;

import com.tr.join.edms.model.vo.Edms;

public interface EdmsService {

	//view 가져오기 
	/* Employee selectEmployeeByNo(int no); */
	
 int insertbsn(Edms e);
 
	/* List<Edsm> selectEdsmAll(Map<String,Object>param); */
 
 	List<Edms> selectBsnAll();
 	
 	Edms selectByNo(int no);
}
