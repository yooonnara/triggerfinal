package com.tr.join.admin.model.service;

import java.util.List;
import java.util.Map;

import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;



public interface AdminEmployeeService {
	
	List<Department> selectDept();

	List<Job> selectJob();
	
	int checkDuplicationId(String id);
	
	List<Employee> selectEmployeeAll();
	
	int insertEmployee();


}
