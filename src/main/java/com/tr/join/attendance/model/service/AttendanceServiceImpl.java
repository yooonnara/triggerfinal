package com.tr.join.attendance.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.attendance.model.dao.AttendanceDao;
import com.tr.join.attendance.model.vo.Attendance;
@Service
public class AttendanceServiceImpl implements AttendanceService {

	private AttendanceDao dao;
	private SqlSession session;	
	
	public AttendanceServiceImpl(AttendanceDao dao, SqlSession session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	//출퇴근 상세조회
		@Override
		public Attendance selectAttendance(String empNo) {
			return dao.selectAttendance(session, empNo);
		}
		
	//출근 버튼 
	@Override
	public Attendance startInsertAttendance(Map<String,Object> startTimeParam) {
		int result=dao.startInsertAttendance(session, startTimeParam);
		if(result>0) {
			return dao.selectAttendance(session, (String)startTimeParam.get("empNo"));
		}
		return null;
	}
	
	
	

}
