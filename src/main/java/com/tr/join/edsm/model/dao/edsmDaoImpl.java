package com.tr.join.edsm.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.employee.model.vo.Employee;
@Repository
public class edsmDaoImpl implements edsmDao {

	@Override
	public Employee selectEmployeeByno(SqlSession session, int no) {
		
		return session.selectOne("employee.selectEmployeeByno,no");
	}

}
