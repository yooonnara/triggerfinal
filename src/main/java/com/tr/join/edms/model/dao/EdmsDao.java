package com.tr.join.edms.model.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.edms.model.dto.Edms;
import com.tr.join.employee.model.vo.Employee;

public interface EdmsDao {

	/*
	 * Employee selectEmployeeByno(SqlSession session, int no)
	 * 
	 * ;
	 */
		int insertbsn(SqlSession session, Edms e);
		/*
		 * List<Edsm> selectEdsmAll(SqlSession session,Map<String,Object>param>); int
		 * selectEdsmByNo(SqlSession, int no);
		 */
}

