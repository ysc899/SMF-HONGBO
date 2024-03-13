package com.seegene.web.user.customer.notice.vo;

import java.util.Date;

import lombok.Data;

/**
 * 공문에 리스트 객체
 */
@Data
public class NoticeListRO {

	private int row;
	/** 식별자 */
	private int seq;
	
	private String title;
	/** 공문번호 */
	private String noticeNumber;
	
	private long hitCnt;
	
	private String codeCenterName;
	
	private int  fileCnt;
	
	private int  newCnt;
	
	private String newFlag;
	
	private Date editDate;
	
	private Date regDate;
	
	private String loginYn;
	
}
