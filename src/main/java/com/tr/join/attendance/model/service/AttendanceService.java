package com.tr.join.attendance.model.service;


import java.util.List;
import java.util.Map;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.Edsm;

public interface AttendanceService {
	
	//출퇴근 상세조회
	Attendance selectAttendance(int no);
		
	Attendance startInsertAttendance(Map<String,Object> startTimeParam);
	Attendance endInsertAttendance(Map<String,Object> endTimeParam);
	List<Attendance> workCalendarAttendance(int no);
	List<Edsm> workCalendarDayoff(int no);
	List<Edsm> workCalendarTrip(int no);
	Attendance selectWeekWorkTime(int no);
	
	
	
}
