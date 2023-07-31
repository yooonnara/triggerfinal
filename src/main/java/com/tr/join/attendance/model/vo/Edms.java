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
public class Edms {
	
	private int no;
	private Date createDate;
	private String title;
	private String content;
	private int appStatus;
	private Date startDate;
	private Date endDate;
	private int type;

}
