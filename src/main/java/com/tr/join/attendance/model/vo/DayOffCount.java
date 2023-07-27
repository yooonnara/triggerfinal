package com.tr.join.attendance.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DayOffCount {

	private int No; //연차번호
	private String empNo; //사원번호
	private int year; //년도
	private int totalDoCount; //총 연차부여일수
	private int usedDoCount; //사용 연차일수
	private int remainDoCount; //남은 연차일수 
}
