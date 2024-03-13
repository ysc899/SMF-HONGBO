package com.seegene.web.admin.main.popup.vo;

import java.util.Date;

import lombok.Data;

/**
 * 메인 팝업 관련 테이블
 */
@Data
public class MainPopupVO {

	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	
	/** 로그인 여부 타입 코드 */
	private String codeLoginType;

	/** 타이틀 */
	private String title;

	/** 게시물 내용 */
	private String content;

	/** 파일 저장 경로 */
	private String filePath;

	/** 링크 url */
	private String url;

	/** 시작일 */
	private Date startDate;

	/** 종료일 */
	private Date endDate;

	/** 출력 여부 */
	private String printFlag;

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
	
	/** 이미지파일 넓이 */
	private int popupImageWidth;
	
	/** 이미지파일 높이 */
	private int popupImageHeight;
	

}
