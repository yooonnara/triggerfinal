package com.tr.join.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;

public interface AdminEmployeeDao {
	
	List<Department> selectDept(SqlSessionTemplate session);

	List<Job> selectJob(SqlSessionTemplate session);
	
	int checkDuplicationId(SqlSessionTemplate session, String id);
	
	List<Employee> selectEmployeeAll(SqlSessionTemplate session);


}
