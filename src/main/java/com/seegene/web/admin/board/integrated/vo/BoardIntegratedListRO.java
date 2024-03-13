package com.seegene.web.admin.board.integrated.vo;

import java.util.Date;

import lombok.Data;

/**
 * 통합 게시판 내용 리스트용 RO
 */
@Data
public class BoardIntegratedListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 타이틀 */
	private String title;
	
	/** 조회수 */
	private long hitCnt;
	
	/** 공지여부 */
	private String noticeFlag;
	
	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
	/** 최종 수정한 사용자 */
	private String editUserName;
	
	/** 언어코드 */
	private String langType;
	
	/** 시스템 구분 */
	private String systemType;
	
	/** 팝업 사용 여부 */
	private String popupUseYn;
	
	/** 팝업 시작일 */
	private String popupStartDate;
	
	/** 팝업 종료일 */
	private String popupEndDate;
	
	/** 팝업 상단 위치 */
	private String popupTopPosition;
	
	/** 팝업 좌측 위치 */
	private String popupLeftPosition;
}

