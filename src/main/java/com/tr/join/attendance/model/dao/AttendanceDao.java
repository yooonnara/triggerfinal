package com.tr.join.attendance.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.attendance.model.vo.Attendance;

public interface AttendanceDao {
	
	 Attendance selectAttendance(SqlSession session, String empNo);
	 int startInsertAttendance(SqlSession session, Map<String,Object> startTimeParam);
	 int endInsertAttendance(SqlSession session, Map<String,Object> endTimeParam);
}


