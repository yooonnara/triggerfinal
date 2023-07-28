package com.tr.join.attendance.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.attendance.model.vo.Attendance;
@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	
	@Override
	public Attendance selectAttendance(SqlSession session, String empNo) {
		return session.selectOne("attendance.selectAttendance", empNo);
	}
	
	@Override
	public int startInsertAttendance(SqlSession session, Map<String,Object> startTimeParam) {
		return session.insert("attendance.startInsertAttendance", startTimeParam);
	}
	
	@Override
	public int endInsertAttendance(SqlSession session, Map<String,Object> endTimeParam) {
		return session.update("attendance.endInsertAttendance", endTimeParam);
	}
	
}
