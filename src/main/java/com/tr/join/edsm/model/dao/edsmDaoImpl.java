package com.tr.join.edsm.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.employee.model.vo.Employee;

public class edsmDaoImpl implements edsmDao {

	@Override
	public Employee selectEmployeeByno(SqlSession session, int no) {
		
		return session.selectOne("employee.selectEmployeeByno,no");
	}

}
