package com.tr.join.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;

public interface AttendanceDao {
	
	 Attendance selectAttendance(SqlSession session, int no);
	 int startInsertAttendance(SqlSession session, Map<String,Object> startTimeParam);
	 int endInsertAttendance(SqlSession session, Map<String,Object> endTimeParam);
	 List<Attendance> workCalendarAttendance(SqlSession session, int no);

		/*
		 * List<Edms> workCalendarDayoff(SqlSession session, int no); List<Edms>
		 * workCalendarTrip(SqlSession session, int no);
		 */
	 Attendance selectWeekWorkTime(SqlSession session, int no);
	 Attendance selectOverWorkTime(SqlSession session, int no);
	 Attendance selectRemainTime(SqlSession session, int no);
	 Attendance selectMonthTime(SqlSession session, int no);
	 
	 
	 //근태 리스트
	 List<Attendance> selectWorkTimeAll(SqlSession session, Map<String,Object> param);
	 int selectWorkTimeCount(SqlSession session);
	 
	 //검색 기능 - 근태 상태에 따라
	 List<Attendance> searchWorkTimeByStatus(SqlSession session, Map<String,Object> ajaxParam);
	 
	 //검색 기능 - 시작일~종료일에 따라
	 List<Attendance> ajaxworkTimeByDate(SqlSession session, Map<String,Object> ajSearchParam);
	 
	 
	 
	 //근태 관리자
	 List<Attendance> selectAttendanceAll(SqlSession session, Map<String,Object> param);
	 int selectAttendanceCount(SqlSession session);
	 
//---------------연차
	 List<DayOff> selectDayoffAll(SqlSession session, int no);
	 List<DayOff> selectAdminDayoffAll(SqlSession session);
	 int adminResetAll(SqlSession session);
	 List<DayOff> searchDayoffAdmin(SqlSession session, Map<String,String> dayoffParam);


//---------------출장
		/*
		 * List<Edms> selectBusinessTrip(SqlSession session, Map<String,Object> param);
		 * int selectBusinessTripCount(SqlSession session);
		 */

}