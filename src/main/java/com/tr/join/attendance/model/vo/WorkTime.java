package com.tr.join.attendance.model.vo;

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
public class WorkTime {
	private int wtNo; //조정번호
	private String wtDate;//변경 등록일
	private int no; //근태번호-
	private String reStartTime; //수정 출근시간 
	private String reEndTime; //수정 퇴근시간
	private String reContent; //수정사유
	private int appNo; //결재자 사번
	private String appDate; //결재일
	private String appStatus; //결재상태 
	
	private Employee emp;
	private Department dept;
	private Attendance att;
	
	
}
