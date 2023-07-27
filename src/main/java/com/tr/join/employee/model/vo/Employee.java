package com.tr.join.employee.model.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee {
	
	private int no;
	private String number; // 사번
	
	@NotEmpty(message = "아이디를 입력해 주세요.")
	@Size(min=4, message = "아이디를 4글자 이상 입력해 주세요.")
	private String id;
	
	@Pattern(regexp = "((?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\\\W)(?=\\\\S+$).{8,16}"
			,message = "비밀번호는 8~16글자로 입력해 주세요.(영문, 숫자, 특수문자 포함)")
	private String password;
	
	private String name;
	private String gender;
	private String phone;
	private String email;
	private Date dateCreated; // 등록일
	private Date dateModefied; // 수정일
	private Date enrollDate; // 입사일
	private Date resignDate; // 퇴사일
	private int accountStatus; // 계정상태
	private int type; // 관리자 여부
	
	private EmpImg empImg;
	private Department dept;
	private Job job;
	
	

}
