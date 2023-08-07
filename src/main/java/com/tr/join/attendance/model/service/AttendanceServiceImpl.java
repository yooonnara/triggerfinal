package com.tr.join.attendance.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.tr.join.attendance.model.dao.AttendanceDao;
import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;
import com.tr.join.attendance.model.vo.WorkTime;
import com.tr.join.edms.model.vo.Edms;
@Service
public class AttendanceServiceImpl implements AttendanceService {

	private AttendanceDao dao;
	private SqlSession session;	
	
	public AttendanceServiceImpl(AttendanceDao dao, SqlSession session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	//출퇴근 상세조회
		@Override
		public Attendance selectAttendance(int no) {
			return dao.selectAttendance(session, no);
		}
		
	//출근 버튼 
	@Override
	public Attendance startInsertAttendance(Map<String,Object> startTimeParam) { //dao로 보내주는거
		int result=dao.startInsertAttendance(session, startTimeParam); //dao에서 돌려받는 값
		if(result>0) {
			return dao.selectAttendance(session, (int)startTimeParam.get("loginNo"));
		}
		return null;
	}
	
	//퇴근 버튼
	@Override 
	public Attendance endInsertAttendance(Map<String,Object> endTimeParam) {
		int result=dao.endInsertAttendance(session, endTimeParam);
		if(result>0) {
			return dao.selectAttendance(session, (int)endTimeParam.get("loginNo"));
		}
		return null;
	}
	
	
	//근태 캘린더
	//근태 달력 조회
	@Override
	public List<Attendance> workCalendarAttendance(int no){
		return dao.workCalendarAttendance(session, no); 
	}
	
	@Override
	public List<Edms> workCalendarTrip(int no) {
		return dao.workCalendarTrip(session, no);
	}

	//근태 누적 시간
	@Override
	public Attendance selectWeekWorkTime(int no) {
		return dao.selectWeekWorkTime(session, no);
	}
	
	//근태 초과 근무 시간
	@Override
	public Attendance selectOverWorkTime(int no) {
		return dao.selectOverWorkTime(session, no);
	}
	
	//근태 잔여 시간
	@Override
	public Attendance selectRemainTime(int no) {
		return dao.selectRemainTime(session, no);
	}
	
	//근태 이번달 누적 
	@Override
	public Attendance selectMonthTime(int no) {
		return dao.selectMonthTime(session, no);
	}
	
	//근태 리스트
	@Override
	public List<Attendance> selectWorkTimeAll(Map<String,Object> param) {
		return dao.selectWorkTimeAll(session, param);
	}
	
	@Override
	public int selectWorkTimeCount() {
		return dao.selectWorkTimeCount(session);
	}
	
	//검색 기능 - 근태 상태로 조회
	@Override
	public List<Attendance> searchWorkTimeByStatus(Map<String,Object> ajaxParam){
		return dao.searchWorkTimeByStatus(session, ajaxParam);
	}
	
	//근태 시작일~종료일 검색
	public List<Attendance> ajaxworkTimeByDate(Map<String,Object> ajSearchParam){
		return dao.ajaxworkTimeByDate(session, ajSearchParam);
	}
	
	//근태 상세 보기
	@Override
	public List<Attendance> workTimeDetail(Map<String,Object> wkParam) {
		return dao.workTimeDetail(session, wkParam);
	}
	
	//근태 출퇴근 수정 리스트
	@Override
	public List<WorkTime> selectWorkTimeModify(Map<String, Object> wkmParam) {
		return dao.selectWorkTimeModify(session, wkmParam);
	}
	
	//근태 출퇴근 수정
	@Override
	public int insertModifyStartTime(Map param) {
		return dao.insertModifyStartTime(session, param);
	}
	
	//관리자
	@Override
	public List<Attendance> selectAttendanceAll(Map<String,Object> param){
		return dao.selectAttendanceAll(session, param);
	}
	
	@Override
	public int selectAttendanceCount() {
		return dao.selectAttendanceCount(session);
	}
	
	@Override
	public List<WorkTime> adminWorkTimeModify() {
		return dao.adminWorkTimeModify(session);
	}

	@Override
	public List<WorkTime> adminWkDetail(Map<String, Object> param) {
		return dao.adminWkDetail(session, param);
	}

	@Override
	public int updateWtModify(WorkTime w) {
		return dao.updateWtModify(session, w);
	}
	
	@Override
	public int adminModifyWorktimeSubmit(WorkTime w) {
		return dao.adminModifyWorktimeSubmit(session, w);
	}

	@Override
	public int wtModifyReturn(WorkTime w) {
		return dao.wtModifyReturn(session, w);
	}
	
//-------------연차-----------------
	



	@Override
	public List<DayOff> selectDayoffAll(int no){
		return dao.selectDayoffAll(session, no);
	}
	
	@Override
	public List<DayOff> selectAdminDayoffAll(){
		return dao.selectAdminDayoffAll(session);
	}
	
	@Override
	public int adminResetAll() {
		return dao.adminResetAll(session);
	}
	
	@Override
	public int adminCheckReset(DayOff d) {
		return dao.adminCheckReset(session, d);
	}


	@Override
	public List<DayOff> ajaxDfSearch(Map<String, String> dfSearch) {
		return dao.ajaxDfSearch(session, dfSearch);
	}

	@Override
		public int insertDayoff(Map param) {
			return dao.insertDayoff(session, param);
		}
	
	@Override
	public List<Edms> workCalendarDayoff() {
		return dao.workCalendarDayoff(session);
	}

	//-------------출장------------------
	 //출장 리스트 출력
	@Override
	public List<Edms> selectBusinessTrip(int no) {
		return dao.selectBusinessTrip(session, no);
	}

	@Override
	public int BusinessTripCount(int no) {
		return dao.BusinessTripCount(session, no);
	}

	//출장삭제
	@Override
	public int deleteBusinessTrip(int btNo) {
		return dao.deleteBusinessTrip(session, btNo);
	}

	@Override
	public List<Edms> checkCancelList(Map<String, Object> cancelParam) {
		return dao.checkCancelList(session, cancelParam);
	}
	
	@Override
	public List<Edms> adminBusinessTrip() {
		return dao.adminBusinessTrip(session);
	}

	@Override
	public List<Edms> ajaxBtSearch(Map<String, Object> btSearch) {
		return dao.ajaxBtSearch(session, btSearch);
	}
	
	

}
