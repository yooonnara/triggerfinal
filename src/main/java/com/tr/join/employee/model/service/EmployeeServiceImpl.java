package com.tr.join.employee.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tr.join.employee.model.dao.EmployeeDao;
import com.tr.join.employee.model.vo.Employee;
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Employee selectEmployeeById(String id) {
		return dao.selectEmployeeById(session, id);
	}

	@Override
	public int updateEmployee(Map param) {
		return dao.updateEmployee(session, param);
	}
	
	@Override
	public int updatePassword(Map param) {
		return dao.updatePassword(session, param);
	}
	
	

	
	
	

}
