package com.tr.join.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;

@Repository
public class AdminEmployeeDaoImpl implements AdminEmployeeDao {

	
	
	@Override
	public int insertEmployee(SqlSessionTemplate session) {
		return session.insert("adminEmployee.insertEmployee");
	}

	@Override
	public List<Department> selectDept(SqlSessionTemplate session) {
		return session.selectList("adminEmployee.selectDept");
	}

	@Override
	public List<Job> selectJob(SqlSessionTemplate session) {
		return session.selectList("adminEmployee.selectJob");
	}

	@Override
	public int checkDuplicationId(SqlSessionTemplate session, String id) {
		return session.selectOne("adminEmployee.checkDuplicationId", id);
	}

	@Override
	public List<Employee> selectEmployeeAll(SqlSessionTemplate session) {
		return session.selectList("adminEmployee.selectEmployeeAll");
	}
	
	
	
	

	
}