package com.tr.join.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
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
	private AdminEmployeeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	public AdminEmployeeServiceImpl(AdminEmployeeDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<Department> selectDept() {
		return dao.selectDept(session);
	}

	// 멤버 생성하기
	@Override
	public int insertEmployee(Map param) {
		return dao.insertEmployee(session, param);
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
	public List<Employee> selectEmployeeAll(Map<String,Object> param) {
		return dao.selectEmployeeAll(session, param);
	}
	

	@Override
	public int selectEmployeeCount() {
		return dao.selectEmployeeCount(session);
		
	}

	@Override
	public String makeEmpNum() {
		return dao.makeEmpNum(session);
	}

	@Override
	public int updateEmployees(Map param) {
		return dao.updateEmployees(session, param);
	}

	@Override
	public int deleteEmployee(Employee e) {
		return dao.deleteEmployee(session, e);
	}
	
	
	
	
	
	
	
	

	
	
}
