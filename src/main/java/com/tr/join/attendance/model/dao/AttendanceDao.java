package com.tr.join.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.Edsm;

public interface AttendanceDao {
	
	 Attendance selectAttendance(SqlSession session, int no);
	 int startInsertAttendance(SqlSession session, Map<String,Object> startTimeParam);
	 int endInsertAttendance(SqlSession session, Map<String,Object> endTimeParam);
	 List<Attendance> workCalendarAttendance(SqlSession session, int no);
	 List<Edsm> workCalendarDayoff(SqlSession session, int no);
	 List<Edsm> workCalendarTrip(SqlSession session, int no);
	 Attendance selectWeekWorkTime(SqlSession session, int no);
}


