package com.tr.join.employee.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee implements UserDetails{
	
	private int no;
	private String empNum; // 사번
	
	@NotEmpty(message = "아이디를 입력해 주세요.")
	@Size(min=4, message = "아이디를 4글자 이상 입력해 주세요.")
	private String id;
	
	@NotEmpty(message = "비밀번호를 입력해 주세요.")
	@Pattern(regexp = "(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{8,16}"
			,message = "비밀번호는 8~16글자로 입력해 주세요.(영문자, 숫자, 특수문자 포함)")
	private String password;
	
	@NotEmpty(message = "이름을 입력해 주세요.")
	private String name;
	
	@NotEmpty
	private String gender;
	
	@NotEmpty(message = "전화번호를 입력해 주세요.")
	private String phone;
	
	@NotEmpty(message = "이메일을 입력해 주세요.")
	@Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$", message = "이메일 형식이 올바르지 않습니다.")
	private String email;
	
	private Date dateCreated; // 등록일
	private Date dateModefied; // 수정일
	
	@NotEmpty
	private Date enrollDate; // 입사일
	private Date resignDate; // 퇴사일
	
	@NotEmpty
	private int accStatus; // 계정상태 0=정상, 1=중지
	
	@NotEmpty
	private int type; // 관리자 여부 0=일반, 1=관리자
	
	private EmpImg empImg;
	
	@NotEmpty
	private Department dept;
	
	@NotEmpty
	private Job job;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth=new ArrayList<>();
		auth.add(new SimpleGrantedAuthority("USER"));
		if(type==1) auth.add(new SimpleGrantedAuthority("ADMIN"));
		
		return auth;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
	
	

}
