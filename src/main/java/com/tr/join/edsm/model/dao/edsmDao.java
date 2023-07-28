package com.tr.join.edsm.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.employee.model.vo.Employee;

public interface edsmDao {

		Employee selectEmployeeByno(SqlSession session, int no) 
			
		;
}

