package com.tr.join.edsm.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.edsm.model.dao.edsmDao;
import com.tr.join.employee.model.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class edsmServiceImpl implements edsmService {

	
	private edsmDao dao;
	private SqlSession session;
	
	
	public edsmServiceImpl(edsmDao dao, SqlSession session) {
		this.dao= dao;
		this.session=session;
	}
	
	
	@Override
	public Employee selectEmployeeByNo(int no) {
		
		return dao.selectEmployeeByno(session,no);
	}

}
