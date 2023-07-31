package com.tr.join.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tr.join.admin.model.dao.AdminEmployeeDao;
import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;

@Service
public class AdminEmployeeServiceImpl implements AdminEmployeeService {

	@Autowired
	AdminEmployeeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Department> selectDept() {
		return dao.selectDept(session);
	}

	// 멤버 생성하기
	@Override
	public int insertEmployee() {
		return dao.insertEmployee(session);
	}

	@Override
	public List<Job> selectJob() {
		return dao.selectJob(session);
	}

	@Override
	public int checkDuplicationId(String id) {
		return dao.checkDuplicationId(session, id);
	}


	@Override
	public List<Employee> selectEmployeeAll() {
		return dao.selectEmployeeAll(session);
	}
	
	

	
	
}