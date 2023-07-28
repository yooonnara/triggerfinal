package com.tr.join.attendance.model.service;

import java.util.List;
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
	public Attendance startInsertAttendance(Map<String,Object> startTimeParam) { //dao로 보내주는거
		int result=dao.startInsertAttendance(session, startTimeParam); //dao에서 돌려받는 값
		if(result>0) {
			return dao.selectAttendance(session, (String)startTimeParam.get("empNo"));
		}
		return null;
	}
	
	//퇴근 버튼
	@Override
	public Attendance endInsertAttendance(Map<String,Object> endTimeParam) {
		int result=dao.endInsertAttendance(session, endTimeParam);
		if(result>0) {
			return dao.selectAttendance(session,(String)endTimeParam.get("empNo"));
		}
		return null;
	}
	
	//근태 캘린더
	//근태 달력 조회
	@Override
	public List<Attendance> workCalendarAttendance(String empNo){
		return dao.workCalendarAttendance(session, empNo);
	}
	
	
	
	

}
