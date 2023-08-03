package com.tr.join.attendance.model.vo;

import com.tr.join.edms.model.vo.Edms;
import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DayOff {

	private int No; //연차번호
	private String empNo; //사원번호
	private int year; //년도
	private int totalDoCount; //총 연차부여일수
	private int usedDoCount; //사용 연차일수
	private int remainDoCount; //남은 연차일수 
	private int usingDate; //사용 연차일수
	private Edms edms; 	
	private Employee emp;
	private Department dept;
	

	
	
	//sql문에서 0(연차)인 경우~ 목록 가져오기. 
	
	
}
