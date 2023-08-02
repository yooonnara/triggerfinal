package com.tr.join.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;
import com.tr.join.edms.model.vo.Edms;
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
	 
	/*
	 * @Override public List<Edms> workCalendarDayoff(SqlSession session, int no){
	 * return session.selectList("attendance.workCalendarDayoff",no); }
	 * 
	 * @Override public List<Edms> workCalendarTrip(SqlSession session, int no){
	 * return session.selectList("attendance.workCalendarTrip",no); }
	 */
	 
	 @Override
	 public Attendance selectWeekWorkTime(SqlSession session, int no) {
		 return session.selectOne("attendance.selectWeekWorkTime",no);
	 }
	 
	 @Override
	 public Attendance selectOverWorkTime(SqlSession session, int no) {
		 return session.selectOne("attendance.selectOverWorkTime",no);
	 }
	 
	 @Override
	 public Attendance selectRemainTime(SqlSession session, int no) {
		 return session.selectOne("attendance.selectRemainTime",no);
	 }
	 
	 @Override
	 public Attendance selectMonthTime(SqlSession session, int no) {
		 return session.selectOne("attendance.selectMonthTime",no);
	 }
	 
	 //근태 리스트
	 @Override
	 public List<Attendance> selectWorkTimeAll(SqlSession session, Map<String,Object> param) {
		 int cPage=(int)param.get("cPage");
		 int numPerpage=(int)param.get("numPerpage");
		 RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		 return session.selectList("attendance.selectWorkTimeAll",param);
	 }
	 
	 @Override
	 public int selectWorkTimeCount(SqlSession session){
		 return session.selectOne("attendance.selectWorkTimeCount");
	 }
	 
	 //근태 리스트 검색 기능(근태 상태)
	 @Override
	 public List<Attendance> searchWorkTimeByStatus(SqlSession session,Map<String,Object> ajaxParam){
		 return session.selectList("attendance.searchWorkTimeByStatus",ajaxParam);
	 }
	 
	 //근태 시작일~종료일 검색 기능
	 @Override
	 public List<Attendance> ajaxworkTimeByDate(SqlSession session, Map<String,Object> ajSearchParam){
		 return session.selectList("attendance.ajaxworkTimeByDate",ajSearchParam);
	 }
	 
	 
	 
	 
	 
	 //근태 관리자
	 @Override
	 public List<Attendance> selectAttendanceAll(SqlSession session, Map<String,Object> param){
		 	//map 이기 때문에 
			int cPage=(int)param.get("cPage");
			int numPerpage=(int)param.get("numPerpage");
			RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		 
		 return session.selectList("attendance.selectAttendanceAll",null, rb);
	 }
	 
	 @Override
	 public int selectAttendanceCount(SqlSession session) {
		 return session.selectOne("attendance.selectAttendanceCount");
	 }
//------------연차--------------
	 
	 @Override
	 public List<DayOff> selectDayoffAll(SqlSession session, int no){
		 return session.selectList("attendance.selectDayoffAll",no);
	 }
	 
	 @Override
	 public List<DayOff> selectAdminDayoffAll(SqlSession session){
		 return session.selectList("attendance.selectAdminDayoffAll");
	 }

	@Override
	public int adminResetAll(SqlSession session) {
		return session.update("attendance.adminResetAll");
	}

	@Override
	public List<DayOff> searchDayoffAdmin(SqlSession session, Map<String, String> dayoffParam) {
		return session.selectList("attendance.searchDayoffAdmin",dayoffParam);
	}

	
	
	 
	 
//------------출장--------------
	
	@Override
	public List<Edms> selectBusinessTrip(SqlSession session, int no) {
		return session.selectList("attendance.selectBusinessTrip",no);
	}

	@Override
	public int BusinessTripCount(SqlSession session, int no) {
		return session.selectOne("attendance.BusinessTripCount",no);
	}
	
	
	
		/*
		 * @Override public List<Edms> selectBusinessTrip(SqlSession session,
		 * Map<String,Object> param){ int cPage=(int)param.get("cPage"); int
		 * numPerpage=(int)param.get("numPerpage"); RowBounds rb=new
		 * RowBounds((cPage-1)*numPerpage,numPerpage); return
		 * session.selectList("attendance.selectBusinessTrip",null, rb); }
		 * 
		 * @Override public int selectBusinessTripCount(SqlSession session) { return
		 * session.selectOne("attendance.selectBusinessTripCount"); }
		 */
}
