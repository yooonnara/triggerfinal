package com.tr.join.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.tr.join.attendance.model.vo.DayOff;
import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;

public interface AdminEmployeeDao {
	
	List<Department> selectDept(SqlSessionTemplate session);

	List<Job> selectJob(SqlSessionTemplate session);
	
	int checkDuplicationId(SqlSessionTemplate session, String id);
	
	List<Employee> selectEmployeeAll(SqlSessionTemplate session, Map<String,Object> param);
	

	int insertEmployee(SqlSessionTemplate session, Map param);

	int selectEmployeeCount(SqlSessionTemplate session, Map<String,Object> param);
	
	String makeEmpNum(SqlSessionTemplate session);
	
	int updateEmployees(SqlSessionTemplate session, Map param);
	
	int deleteEmployee(SqlSession session, Employee e);

}
