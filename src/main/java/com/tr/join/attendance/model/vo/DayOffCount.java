package com.tr.join.attendance.model.vo;

import java.util.Date;

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
	
	//결재 객체
	private Date createDate;
	private String title;
	private String content;
	private int appStatus;
	private int docStatus;
	private Date startDate;
	private Date endDate;
	private int type;
	
	
	//sql문에서 0(연차)인 경우~ 목록 가져오기. 
	
	
}
