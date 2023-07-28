package com.tr.join.attendance.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tr.join.attendance.model.service.AttendanceService;
import com.tr.join.attendance.model.vo.Attendance;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
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
	//출근 버튼
	public Attendance startInsertAttendance(String startTime) { 
		log.debug(startTime);
		//startTime - ajax의 data가 넘긴 값 
		Map<String,Object> startTimeParam=new HashMap();
		startTimeParam.put("startTime", startTime);
		startTimeParam.put("empNo","J001"); //임의 정보 
		//log.info("{}",startTimeParam);
		Attendance attendanceResult = service.startInsertAttendance(startTimeParam);
		System.out.println(attendanceResult);
		//저장이 되면 객체가 반환되고, 저장실패하면 null값반환.
		return attendanceResult;
	}
	
	//퇴근 버튼
	@RequestMapping("/att/endInsert")
	@ResponseBody
	public Attendance endInsertAttendance(String endTime) {
		log.debug(endTime); //결과나옴 
		Map<String,Object> endTimeParam = new HashMap(); //왜못넘김???
		endTimeParam.put("endTime", endTime);
		endTimeParam.put("empNo","J001");
		
		Attendance attendanceEndResult = service.endInsertAttendance(endTimeParam);
		System.out.println(attendanceEndResult);
		return attendanceEndResult;
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