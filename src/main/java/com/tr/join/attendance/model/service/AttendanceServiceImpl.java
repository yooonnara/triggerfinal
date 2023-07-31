package com.tr.join.attendance.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.attendance.model.dao.AttendanceDao;
import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;
import com.tr.join.attendance.model.vo.Edsm;
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
		public Attendance selectAttendance(int no) {
			return dao.selectAttendance(session, no);
		}
		
	//출근 버튼 
	@Override
	public Attendance startInsertAttendance(Map<String,Object> startTimeParam) { //dao로 보내주는거
		int result=dao.startInsertAttendance(session, startTimeParam); //dao에서 돌려받는 값
		if(result>0) {
			return dao.selectAttendance(session, (int)startTimeParam.get("loginNo"));
		}
		return null;
	}
	
	//퇴근 버튼
	@Override 
	public Attendance endInsertAttendance(Map<String,Object> endTimeParam) {
		int result=dao.endInsertAttendance(session, endTimeParam);
		if(result>0) {
			return dao.selectAttendance(session, (int)endTimeParam.get("loginNo"));
		}
		return null;
	}
	
	
	//근태 캘린더
	//근태 달력 조회
	@Override
	public List<Attendance> workCalendarAttendance(int no){
		return dao.workCalendarAttendance(session, no); 
	}
	
	@Override
	public List<Edsm> workCalendarDayoff(int no){
		return dao.workCalendarDayoff(session, no);
	}
	
	@Override
	public List<Edsm> workCalendarTrip(int no){
		return dao.workCalendarTrip(session, no);
	}
	
	
	//근태 누적 시간
	@Override
	public Attendance selectWeekWorkTime(int no) {
		return dao.selectWeekWorkTime(session, no);
	}
	
	//근태 초과 근무 시간
	@Override
	public Attendance selectOverWorkTime(int no) {
		return dao.selectOverWorkTime(session, no);
	}
	
	//근태 잔여 시간
	@Override
	public Attendance selectRemainTime(int no) {
		return dao.selectRemainTime(session, no);
	}
	
	//근태 이번달 누적 
	@Override
	public Attendance selectMonthTime(int no) {
		return dao.selectMonthTime(session, no);
	}
	
	
	//관리자
	@Override
	public List<Attendance> selectAttendanceAll(Map<String,Object> param){
		return dao.selectAttendanceAll(session, param);
	}
	
	@Override
	public int selectAttendanceCount() {
		return dao.selectAttendanceCount(session);
	}
	
	
	
//--------연차---------------------------
	
	@Override
	public List<DayOff> selectDayoffAll(int no){
		return dao.selectDayoffAll(session, no);
	}
	
	

}
