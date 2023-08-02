package com.tr.join.edms.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Edms> selectBsnAll(SqlSession session,Map<String,Object>param){
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		
		return session.selectList("edms.selectBsnAll",null, rb);
	}
	
	@Override
	public int selectEdmsCount(SqlSession session) {
		
		return session.selectOne("edms.selectEdmsCount");
	}

	@Override
	public Edms selectByNo(SqlSession session, int no) {
		return session.selectOne("edms.selectByNo",no );
	}

	@Override
	public int insertVc(SqlSession session, Edms d) {
		// TODO Auto-generated method stub
		return session.insert("edms.insertVc", d);
	}

	@Override
	public List<Edms> selectVc(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("edms.selectVc");
	}
	
	
	
}
