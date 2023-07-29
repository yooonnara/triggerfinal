package com.tr.join.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Job;

@Repository
public class AdminEmployeeDaoImpl implements AdminEmployeeDao {

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
	
	

	
}
