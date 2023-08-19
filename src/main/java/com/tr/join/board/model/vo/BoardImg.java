package com.tr.join.board.model.vo;

import java.util.Date;
import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardImg {
	private int no;
	private int boardNo; //board의 커뮤니티 번호여야 한다. 
	private String fileName;
	private String saveFileName;
}
