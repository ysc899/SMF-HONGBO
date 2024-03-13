package com.seegene.web.admin.board.notice.vo;

import java.util.Date;

import lombok.Data;

/**
 * 공문 리스트용
 */
@Data
public class BoardNoticeListRO {
	
	private int row;
	
	/** 식별자 */
	private int seq;

	/** 센터 종류 타입 코드 */
	private String codeCenterType;
	
	/** 센터 종류 타입 이름 */
	private String codeCenterName;

	/** 언어 타입 코드 */
	private String codeLangType;
	
	/** 언어 타입 이름 */
	private String codeLangName;
	/** 공문번호 */
	private String noticeNumber;
	/** 타이틀 */
	private String title;
	
	/** 조회 수 */
	private long hitCnt;
	
	/** 공지여부 여부 */
	private String noticeFlag;
	
	/** 최종 수정일 */
	private Date editDate;

}
