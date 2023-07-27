package com.tr.join.attendance.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tr.join.attendance.model.service.AttendanceService;
import com.tr.join.attendance.model.vo.Attendance;


@Controller
public class AttendanceController {
	
	private AttendanceService service;
	
	public AttendanceController(AttendanceService service) {
		this.service=service;
	}
	
	@GetMapping("/workTimeMain")
	public String workTimeMain() {
		return "attendance/workTimeMain";
	}

	@RequestMapping("/att/startInsert")
	@ResponseBody
	//버튼을 누르면 현재 시각이 찍힌다. -> 입력과 출력을 동시에
	public Attendance startInsertAttendance(String startTime, HttpSession session, Model m) { //startTime-ajax의 data가 넘긴 값 
		Map<String,Object> startTimeParam=new HashMap();
		startTimeParam.put("startTime", startTime);
		startTimeParam.put("empNo","J001"); //임의 정보 
		Attendance attendanceResult = service.startInsertAttendance(startTimeParam);
		//System.out.println(result);
		//Attendance at = service.selectAttendance(a);
		//저장이 되면 객체가 반환되고, 저장실패하면 null값반환.
		return attendanceResult;
		
		
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