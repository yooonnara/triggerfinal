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
	public List<Edms> selectBsnAll(SqlSession session,Map<String,Object> param){
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		
		return session.selectList("edms.selectBsnAll",param);
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

	//어드민 계정 구현하기 리스트 출력하기 
	
	@Override
	public List<Edms> adminBsnSelect(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("edms.adminBsnSelect");
	}

	@Override
	public Edms selectByBsnNo(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("edms.selectByBsnNo",no);
	}

	@Override
	public List<Edms> searchEdmsByStatus(SqlSession session, Map<String,Object> ajaxParam) {
		// TODO Auto-generated method stub
		return session.selectList("edms.searchEdmsByStatus",ajaxParam);
	}

	@Override
	public List<Edms> selectResearch(SqlSession session, Edms edms){
		// TODO Auto-generated method stub
		return session.selectList("edms.selectResearch",edms);
	}

	@Override
	public List<Edms> adminVcSelect(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("edms.adminVcSelect");
	}

	@Override
	public int updateAppStatus(SqlSession session, Map<String, Integer> ajaxNumber) {
		// TODO Auto-generated method stub
		return session.update("edms.updateAppStatus",ajaxNumber);
	
	
	}
	
	//연차 상세 view 출력하기 

	@Override
	public Edms selectByVcNo(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("edms.selectByVcNo",no);
	}
	//어드민 계정 연차 ajax로 출력하기 

	@Override
	public List<Edms> searchVc(SqlSession session, Edms edms) {
		// TODO Auto-generated method stub
		return session.selectList("edms.searchVc",edms);
	}
	
	
	
	
	
	
	
}
