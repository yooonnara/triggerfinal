package com.tr.join.edms.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Edms {
	private int No;//전자결재번호
	private int empNo;//사원번호
	@NotEmpty(message="제목은 반드시 입력하세요")
	private String title;
	@Min(value=10, message="10자 이상 입력하세요") @Max(value=1000,message="1000자 이하로 입력하세요")
	private String content;
	private int appStatus;
	private Date startDate;
	private Date endDate;
	private int type;
	private Date createDate;
	private int jobNo;
	private int deptNo;
	private String detailType;
	private Employee emp;
	
	//private Department department;
	
	

}
