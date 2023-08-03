package com.tr.join.employee.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.tr.join.employee.model.vo.Employee;

public interface EmployeeDao {

	Employee selectEmployeeById(SqlSessionTemplate session, String id);
	
	int updateEmployee(SqlSessionTemplate session, Map param);
	
}
