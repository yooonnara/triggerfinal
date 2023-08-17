package com.tr.join.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;
import com.tr.join.attendance.model.vo.WorkTime;
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

	@Override
	public List<Edms> workCalendarTrip(SqlSession session, int no) {
		return session.selectList("attendance.workCalendarTrip", no);
	}

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
	 
	 //근태 주차별 리스트
	 @Override
		public List<Attendance> workTimeWeekly(SqlSession session, int no) {
			return session.selectList("attendance.workTimeWeekly", no);
		}

	 //근태 일자별 리스트
	 @Override
	 public List<Attendance> selectWorkTimeAll(SqlSession session, Map<String,Object> param) {
		 int cPage=(int)param.get("cPage");
		 int numPerpage=(int)param.get("numPerpage");
		 RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		 return session.selectList("attendance.selectWorkTimeAll",param,rb);
	 }
	 
	@Override
	 public int selectWorkTimeCount(SqlSession session, int no){
		 return session.selectOne("attendance.selectWorkTimeCount", no);
	 }
	 
	 //근태 리스트 검색 기능(근태 상태)
	 @Override
	 public List<Attendance> searchWorkTimeByStatus(SqlSession session,Map<String,Object> ajaxParam){
		 int cPage=(int)ajaxParam.get("cPage");
		 int numPerpage=(int)ajaxParam.get("numPerpage");
		 RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		 return session.selectList("attendance.searchWorkTimeByStatus",ajaxParam ,rb);
	 }
	 
	 @Override
	public int searchWorkTimeCount(SqlSession session, Map<String, Object> ajaxParam) {
		return session.selectOne("attendance.searchWorkTimeCount", ajaxParam);
	}

	//근태 시작일~종료일 검색 기능
	 @Override
	 public List<Attendance> ajaxworkTimeByDate(SqlSession session, Map<String,Object> ajSearchParam){
		 return session.selectList("attendance.ajaxworkTimeByDate",ajSearchParam);
	 }
	 
	 @Override
	public List<Attendance> workTimeDetail(SqlSession session, Map<String,Object> wkParam) {
		return session.selectList("attendance.workTimeDetail", wkParam);
	}
	 

	@Override
	public List<WorkTime> selectWorkTimeModify(SqlSession session, Map<String, Object> wkmParam) {
		return session.selectList("attendance.selectWorkTimeModify", wkmParam);
	}
	
	@Override
	public int insertModifyStartTime(SqlSession session, Map param) {
		return session.insert("attendance.insertModifyStartTime",param);
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
	 @Override
		public List<WorkTime> adminWorkTimeModify(SqlSession session) {
			return session.selectList("attendance.adminWorkTimeModify");
		}
	 
	 @Override
		public List<WorkTime> adminWkDetail(SqlSession session, Map<String, Object> param) {
			return session.selectList("attendance.adminWkDetail",param);
		}
	 
		@Override
		public int updateWtModify(SqlSession session, WorkTime w) {
			return session.update("attendance.updateWtModify", w);
		}
		
		@Override
		public int adminModifyWorktimeSubmit(SqlSession session, WorkTime w) {
			return session.update("attendance.adminModifyWorktimeSubmit", w);
		}
		
		@Override
		public int wtModifyReturn(SqlSession session, WorkTime w) {
			return session.update("attendance.wtModifyReturn", w);
		}

	 
//------------연차--------------

	
	@Override
	 public List<DayOff> selectDayoffAll(SqlSession session, Map<String,Object> param){
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("attendance.selectDayoffAll",param,rb);
	 }
	 
	
	 @Override
	public int dayoffAllCount(SqlSession session, int no) {
		return session.selectOne("attendance.dayoffAllCount", no);
	}

	@Override
	 public List<DayOff> selectAdminDayoffAll(SqlSession session,Map<String,Object> param){
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("attendance.selectAdminDayoffAll",param,rb);
	 }
	

	@Override
	public int AdminDayoffCount(SqlSession session) {
		return session.selectOne("attendance.AdminDayoffCount");
	}

	@Override
	public int adminResetAll(SqlSession session) {
		return session.update("attendance.adminResetAll");
	}
	
	@Override
	public int adminCheckReset(SqlSession session, DayOff d) {
		return session.update("attendance.adminCheckReset", d);
	}

	

	@Override
	public List<DayOff> ajaxDfSearch(SqlSession session, Map<String, String> dfSearch) {
		return session.selectList("attendance.ajaxDfSearch", dfSearch);
	}

	@Override
	public int insertDayoff(SqlSession session, Map param) {
		return session.update("attendance.insertDayoff",param);
	}
	
	@Override
	public List<Edms> workCalendarDayoff(SqlSession session) {
		return session.selectList("attendance.workCalendarDayoff");
	}	 
	 
//------------출장--------------
	

	@Override
	public List<Edms> selectBusinessTrip(SqlSession session, Map<String,Object> param) {
		int cPage=(int)param.get("cPage");
		int numPerpage=(int)param.get("numPerpage");
		RowBounds rb=new RowBounds((cPage-1)*numPerpage,numPerpage);
		return session.selectList("attendance.selectBusinessTrip",param,rb);
	}

	@Override
	public int BusinessTripCount(SqlSession session, int no) {
		return session.selectOne("attendance.BusinessTripCount",no);
	}

	//출장 삭제
	@Override
	public int deleteBusinessTrip(SqlSession session, int btNo) {
		return session.update("attendance.deleteBusinessTrip",btNo);
	}

	@Override
	public List<Edms> checkCancelList(SqlSession session, Map<String, Object> cancelParam) {
		return session.selectList("attendance.checkCancelList",cancelParam);
	}

	@Override
	public List<Edms> adminBusinessTrip(SqlSession session) {
		return session.selectList("attendance.adminBusinessTrip");
	}

	@Override
	public List<Edms> ajaxBtSearch(SqlSession session, Map<String, Object> btSearch) {
		return session.selectList("attendance.ajaxBtSearch", btSearch);
	}
	
	
	
	
}
