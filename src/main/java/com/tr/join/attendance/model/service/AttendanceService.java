package com.tr.join.attendance.model.service;


import java.util.List;
import java.util.Map;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;
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
	Attendance selectOverWorkTime(int no);
	Attendance selectRemainTime(int no);
	Attendance selectMonthTime(int no);

	//근태 리스트
	List<Attendance> selectWorkTimeAll(Map<String,Object> param);
	int selectWorkTimeCount();
	//관리자 페이지
	List<Attendance> selectAttendanceAll(Map<String,Object> param);
	int selectAttendanceCount();
	
//---------------연차---------------------
	List<DayOff> selectDayoffAll(int no);
	
	
	
	
}
