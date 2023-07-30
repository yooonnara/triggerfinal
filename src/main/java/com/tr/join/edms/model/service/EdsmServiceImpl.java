package com.tr.join.edms.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tr.join.edms.model.dao.EdmsDao;
import com.tr.join.edms.model.dto.Edms;
@Service
public class EdsmServiceImpl implements EdmsService {

		@Autowired
	private EdmsDao dao;
		@Autowired
	private SqlSession session;
	
	
	/*
	 * public EdsmServiceImpl(EdsmDao dao, SqlSession session) { this.dao= dao;
	 * this.session=session; }
	 */
	
	@Override
	public int insertbsn(Edms e) {
		return dao.insertbsn(session, e);
}

}