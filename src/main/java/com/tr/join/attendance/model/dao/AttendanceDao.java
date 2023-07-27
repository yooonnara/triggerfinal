package com.tr.join.attendance.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.attendance.model.vo.Attendance;

public interface AttendanceDao {
	int startInsertAttendance(SqlSession session, Map<String,Object> startTimeParam);
	
	 Attendance selectAttendance(SqlSession session, String empNo);
	
}


