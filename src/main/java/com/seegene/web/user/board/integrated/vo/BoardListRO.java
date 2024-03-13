package com.seegene.web.user.board.integrated.vo;

import java.util.Date;

import lombok.Data;

/**
 * 게시물 리스트 용
 */
@Data
public class BoardListRO {
	
	private int row;
	
	private int seq;
	
	private String title;
	
	private Date regDate;
	
	private Date editDate;
	
	private int  fileCnt;
	
	private long hitCnt;
	
	private String newFlag;
	
	private String thumContent;
	
	private String content;
	
	private String oneClickGcd;
	
	private String oneClickGnm;
	
	private String langType;
	
}
