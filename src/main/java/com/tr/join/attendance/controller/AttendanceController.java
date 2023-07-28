package com.tr.join.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AttendanceController {
	
	@GetMapping("/workTimeMain")
	public String workTimeMain() {
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