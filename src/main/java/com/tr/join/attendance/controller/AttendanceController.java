package com.tr.join.attendance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tr.join.attendance.model.service.AttendanceService;
import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.Edsm;
import com.tr.join.employee.model.vo.Employee;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class AttendanceController {
	
	private AttendanceService service;
	public AttendanceController(AttendanceService service) {
		this.service=service;
	}
	
//	@GetMapping("/workTimeMain")
//	public String workTimeMain() {
//		return "attendance/workTimeMain";
//	}

	@RequestMapping("/att/startInsert")
	@ResponseBody
	//버튼을 누르면 현재 시각이 찍힌다. -> 입력과 출력을 동시에
	//출근 버튼
	public Attendance startInsertAttendance(String startTime) {  // - ajax의 data가 넘긴 값 

		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //security 로그인 정보
		Map<String,Object> startTimeParam=new HashMap(); //Map 생성
		startTimeParam.put("startTime", startTime); 
		startTimeParam.put("loginNo",loginNo.getNo()); //사원번호 -int형 
		Attendance attendanceResult = service.startInsertAttendance(startTimeParam);
		//System.out.println(attendanceResult);
		//저장이 되면 객체가 반환되고, 저장실패하면 null값반환.
		return attendanceResult;
	}
	
	 //퇴근 버튼
	 @RequestMapping("/att/endInsert")
	 @ResponseBody 
	 public Attendance endInsertAttendance(String endTime) {
		 Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 Map<String,Object> endTimeParam = new HashMap();
		 endTimeParam.put("endTime", endTime);
		 endTimeParam.put("loginNo", loginNo.getNo());
		 Attendance attendanceEndResult = service.endInsertAttendance(endTimeParam);
		 return attendanceEndResult;
	 }
	
	 
	 
	
	//근태 캘린더
	//전체 근태 정보 받아오기. List로 받아와서 뿌리기 ? 
	//전체 연차 정보 받아오기. 
	//전체 출장 정보 받아오기. 
	 @RequestMapping("/att/workCalendar")
	 @ResponseBody
	 public Map<String, Object> workCalendar() {
		 Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		 List<Attendance> attendanceInfo = service.workCalendarAttendance(loginNo.getNo());
		 List<Edsm> dayoffInfo = service.workCalendarDayoff(loginNo.getNo());
		 List<Edsm> tripInfo = service.workCalendarTrip(loginNo.getNo());
		 
		 Map<String,Object> calendarParam=new HashMap(); 
		 calendarParam.put("attInfo",attendanceInfo);
		 calendarParam.put("dayoffInfo",dayoffInfo);
		 calendarParam.put("tripInfo",tripInfo);
		 
		// System.out.println(calendarParam);
		 return calendarParam;
	 }
	 
	  //근태 누적/초과/잔여 시간
	  @GetMapping("/workTimeMain")
	  public String workingTime(Model m) { 
	  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		 Attendance week = service.selectWeekWorkTime(loginNo.getNo()); //이번주 누적 근무 시간
		
		 m.addAttribute("week",week);
		 System.out.println(m); 
		  
		  return "attendance/workTimeMain";
		
		 }
		
	

	
	
	
	
	
	
	@GetMapping("/workTimeWeekly")
		public String workTimeWeekly() {
			return "attendance/workTimeWeekly";
	}
	
	@GetMapping("/workTimeList")
	public String workTimeList() {
		return "attendance/workTimeList";
}
	@GetMapping("/dayoffList")
	public String dayoffList() {
		return "attendance/dayoffList";
}

	@GetMapping("/businessTripList")
	public String businessTripList() {
		return "attendance/businessTripList";
}
	
	
/*----------------------관리자 페이지----------------------*/
	
	@GetMapping("/adminWorkTime")
	public String adminWorkTime() {
		return "admin/adminWorkTime";
}
	@GetMapping("/adminDayoff")
	public String adminDayoff() {
		return "admin/adminDayoff";
}
	
	@GetMapping("/adminBusinessTrip")
	public String adminBusinessTrip() {
		return "admin/adminBusinessTrip";
}
	
	
	
	
/*----------------------근태 출퇴근 관리 버튼----------------------*/
//	@Autowired
//	private EssService eService; 
//1. 서비스 정의 
//2. json 라이브러리 추가
//3. 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}