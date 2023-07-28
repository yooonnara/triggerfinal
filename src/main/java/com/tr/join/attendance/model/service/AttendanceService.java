package com.tr.join.attendance.model.service;


import java.util.List;
import java.util.Map;

import com.tr.join.attendance.model.vo.Attendance;

public interface AttendanceService {
	
	//출퇴근 상세조회
	Attendance selectAttendance(String empNo);
		
	Attendance startInsertAttendance(Map<String,Object> startTimeParam);
	Attendance endInsertAttendance(Map<String,Object> endTimeParam);
	
	//근태 캘린더 
	List<Attendance> workCalendarAttendance(String empNo);
	
}
