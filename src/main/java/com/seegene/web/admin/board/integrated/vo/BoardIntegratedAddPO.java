package com.seegene.web.admin.board.integrated.vo;

import java.util.Date;
import java.util.Optional;

import lombok.Data;

/**
 * 게시물 등록 PO
 */
@Data
public class BoardIntegratedAddPO {


	/** 타이틀 */
	private String title;
	
	/** 내용 */
	private String content;

	/** 공지여부 */
	private String noticeFlag;

	/** 검사코드 */
	private String oneClickGcd;
	
	/** 신규 검사코드명 */
	private String oneClickGnm;
	
	/** 신규 검사코드명 */
	private String langType;
	
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