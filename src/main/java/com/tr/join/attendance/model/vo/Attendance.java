package com.tr.join.attendance.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attendance {
	private int No; //근태번호 
	private String empNo; //사원번호 
	private String attDate; //근무날짜
	private String startTime; //출근시간
	private String endTime; //퇴근시간
	private int status; //근무상태 0:정상 1:지각 2:조퇴 3:결근 4:휴가 5:출장 default:조퇴
	
	private String weekTime; //주별시간
	private String monthTime; //달별시간
	private String remainTime; //누적시간
	private String overTime; //추가시간
	
	//private String startDate;
	//private String endDate;
	
	
}
