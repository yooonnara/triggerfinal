package com.tr.join.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;

@Repository
public class AdminEmployeeDaoImpl implements AdminEmployeeDao {

	
	
	@Override
	public int insertEmployee(SqlSessionTemplate session, Map param) {
		return session.insert("adminEmployee.insertEmployee", param);
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
	public List<Employee> selectEmployeeAll(SqlSessionTemplate session, Map<String,Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("adminEmployee.selectEmployeeAll",param,rb);
	}
	

	@Override
	public int selectEmployeeCount(SqlSessionTemplate session, Map<String,Object> param) {
		return session.selectOne("adminEmployee.selectEmployeeCount", param);
	}

	@Override
	public String makeEmpNum(SqlSessionTemplate session) {
		return session.selectOne("adminEmployee.makeEmpNum");
	}

	@Override
	public int updateEmployees(SqlSessionTemplate session, Map param) {
		return session.update("adminEmployee.updateEmployees", param);
	}

	@Override
	public int deleteEmployee(SqlSession session, Employee e) {
		return session.delete("adminEmployee.deleteEmployee", e);
	}
	
	
	
	
	
	
	
	
	
	
	

	
}
