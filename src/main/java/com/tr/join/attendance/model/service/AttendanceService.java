package com.tr.join.attendance.model.service;


import java.util.List;
import java.util.Map;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;
import com.tr.join.attendance.model.vo.Edms;
import com.tr.join.attendance.model.vo.Edms;

public interface AttendanceService {
	
	//출퇴근 상세조회
	Attendance selectAttendance(int no);
		
	Attendance startInsertAttendance(Map<String,Object> startTimeParam);
	Attendance endInsertAttendance(Map<String,Object> endTimeParam);
	List<Attendance> workCalendarAttendance(int no);
	List<Edms> workCalendarDayoff(int no);
	List<Edms> workCalendarTrip(int no);
	Attendance selectWeekWorkTime(int no);
	Attendance selectOverWorkTime(int no);
	Attendance selectRemainTime(int no);
	Attendance selectMonthTime(int no);

	//근태 리스트
	List<Attendance> selectWorkTimeAll(Map<String,Object> param);
	int selectWorkTimeCount();
	
	//근태 상태로 검색
	List<Attendance> searchWorkTimeByStatus(Map<String,Object> ajaxParam);
	//관리자 페이지
	List<Attendance> selectAttendanceAll(Map<String,Object> param);
	int selectAttendanceCount();
	
//---------------연차---------------------
	List<DayOff> selectDayoffAll(int no);
	
//-----------출장-------------------------
	List<Edms> selectBusinessTrip(Map<String,Object> param);
	int selectBusinessTripCount();
	
	
}
