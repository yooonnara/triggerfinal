package com.tr.join.employee.model.service;

import java.util.Map;

import com.tr.join.employee.model.vo.Employee;


public interface EmployeeService {
	
	Employee selectEmployeeById(String id);
	
	int updateEmployee(Map param);
	

}
