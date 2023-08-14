package com.tr.join.edms.model.vo;

import java.sql.Date;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attachment {

	private int fileNo;
	private int edmsNo; //전자결재 fk값 
	private String originalFilename;// 원본파일 이름 
	private String renamedFilename; //서버저장용 파일이음
	private Date uploadDate;
	//private int fileAttached; //파일 첨부 여부 (첨부 1, 미첨부0)
	
	private int downloadCount ;// 다운로드 한 정도 값

}
