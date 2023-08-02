package com.tr.join.edms.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.edms.model.vo.Edms;
import com.tr.join.employee.model.vo.Employee;
@Repository
public class EdmsDaoImpl implements EdmsDao {

	/*
	 * @Override public Employee selectEmployeeByno(SqlSession session, int no) {
	 * 
	 * return session.selectOne("employee.selectEmployeeByno,no"); }
	 */
	@Override
	public int insertbsn(SqlSession session, Edms e) {
		return session.insert("edms.insertbsn", e);
	}

	@Override
	public List<Edms> selectBsnAll(SqlSession session){
		return session.selectList("edms.selectBsnAll");
	}
	
	@Override
	public Edms selectByNo(SqlSession session, int no) {
		return session.selectOne("edms.selectByNo",no );
	}
}
