package com.tr.join.employee.model.service;

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
		// TODO Auto-generated method stub
		return dao.selectEmployeeById(session, id);
	}
	
	

	
	
	
	

}
