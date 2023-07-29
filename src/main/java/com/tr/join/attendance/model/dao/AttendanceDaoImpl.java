package com.tr.join.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.Edsm;
@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	
	@Override
	public Attendance selectAttendance(SqlSession session, int no) {
		return session.selectOne("attendance.selectAttendance", no);
	}
	
	@Override
	public int startInsertAttendance(SqlSession session, Map<String,Object> startTimeParam) {
		return session.insert("attendance.startInsertAttendance", startTimeParam);
	}
	
	@Override
	public int endInsertAttendance(SqlSession session, Map<String,Object> endTimeParam) {
		return session.update("attendance.endInsertAttendance", endTimeParam);
	}
	
	
	 @Override 
	 public List<Attendance> workCalendarAttendance(SqlSession session, int no){ 
		 return session.selectList("attendance.workCalendarAttendance", no); 
	}
	 
	 @Override
	 public  List<Edsm> workCalendarDayoff(SqlSession session, int no){
		 return session.selectList("attendance.workCalendarDayoff",no);
	 }
	 
	 @Override
	 public  List<Edsm> workCalendarTrip(SqlSession session, int no){
		 return session.selectList("attendance.workCalendarTrip",no);
	 }
	 
	 @Override
	 public Attendance selectWeekWorkTime(SqlSession session, int no) {
		 return session.selectOne("attendance.selectWeekWorkTime",no);
	 }
	 
}
