package com.tr.join.attendance.controller;

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
}