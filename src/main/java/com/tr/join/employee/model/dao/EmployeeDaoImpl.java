package com.tr.join.employee.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tr.join.employee.model.vo.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public Employee selectEmployeeById(SqlSessionTemplate session, String id) {
		return session.selectOne("employee.selectEmployeeById", id);
	}
	
	@Override
	public int updateEmployee(SqlSessionTemplate session, Map param) {
		return session.update("employee.updateEmployee", param);
	}

	@Override
	public int updatePassword(SqlSessionTemplate session, Map param) {
		return session.update("employee.updatePassword", param);
	}

}
