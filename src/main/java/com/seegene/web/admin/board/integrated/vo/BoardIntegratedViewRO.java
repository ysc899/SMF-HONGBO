package com.seegene.web.admin.board.integrated.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 게시판 내용 상세 조회용
 */
@Data
public class BoardIntegratedViewRO {
	
	/** 식별자 */
	private int seq;
	
	/** 타이틀 */
	private String title;

	/** 게시물 내용 */
	private String content;

	/** 조회 수 */
	private long hitCnt;

	/** 공지여부 여부 */
	private String noticeFlag;
	
	/** 섬네일 base64 정보 */
	private String thumImageBase64;
	
	/** 최종 수정일 */
	private Date editDate;
	
	/** 최종 수정자 ID */
	private String editUserId;
	/** 최종 수정자 이름 */
	private String editUserName;
	
	/** 첨부 파일들 */
	private List<BoardIntegratedFileViewRO> files;
	
	/** 검사 코드 */
	private String oneClickGcd;
	
	/** 검사 코드명 */
	private String oneClickGnm;

	/** 언어 코드 */
	private String langType;
	
	/** 시스템 구분 */
	private String systemType;
	
	/** 팝업 사용 여부 */
	private String popupUseYn;
	
	/** 팝업 시작일 */
	private Date popupStartDate;
	
	/** 팝업 종료일 */
	private Date popupEndDate;
	
	/** 팝업 상단 좌표 */
	private String popupTopPosition ;
	
	/** 팝원 좌측 좌표 */
	private String popupLeftPosition ;
	
}

