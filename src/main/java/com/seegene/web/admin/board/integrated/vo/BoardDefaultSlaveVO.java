package com.seegene.web.admin.board.integrated.vo;

import java.util.Date;

import lombok.Data;

/**
 * 통합 게시판 내용
 */
@Data
public class BoardDefaultSlaveVO {
	/** 식별자 */
	private int seq;

	/** 통합게시판 마스터 */
	private int boardDefaultMasterSeq;

	/** 타이틀 */
	private String title;

	/** 게시물 내용 */
	private String content;

	/** 조회 수 */
	private long hitCnt;

	/** 공지여부 여부 */
	private String noticeFlag;
	
	/** 신규 검사코드 */
	private String oneClickGcd;
	
	/** 신규 검사코드명 */
	private String oneClickGnm;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;
	
	/** 삭제 여부 */
	private String langType;
	
	/** paging 처리 */
	private String pageNumber;
	
	/** 시스템 구분 */
	private String systemType;
	
	/** 팝업 사용 여부 */
	private String popupUseYn;
	
	/** 팝업 시작일 */
	private String popupStartDate;
	
	/** 팝업 종료일 */
	private String popupEndDate;
	
	/** 팝업 상단 좌표 */
	private String popupTopPosition ;
	
	/** 팝원 좌측 좌표 */
	private String popupLeftPosition ;
	
	
	
}

