package com.tr.join.employee.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmpImg {
	
	private int no;
	private String fileName;
	private String saveFileName;

}
