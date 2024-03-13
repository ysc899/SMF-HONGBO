package com.seegene.web.admin.main.popup.vo;

import java.util.Date;

import lombok.Data;

/**
 * 로고 관리 리스트용
 */
@Data
public class MainPopupViewRO{

	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;
	
	/** 로그인 여부 타입 코드 */
	private String codeLoginType;
	private String codeLoginName;
	
	/** 관리자용 식별자 */
	private String title;
	
	/** 시작일 */
	private Date startDate;

	/** 종료일 */
	private Date endDate;
	
	/** URL */
	private String url;
	
	/** 파일 경로 */
	private String filePath;
	
	/** 파일 이미지 */
	private String fileContent;
	
	private String printFlag;

	/** 최종 수정일 */
	private Date editDate;
	
	/** 최종 수정자 ID */
	private String editUserId;
	/** 최종 수정자 명 */
	private String editUserName;
	
	/** 이미지파일 넓이 */
	private int popupImageWidth;
	/** 이미지파일 높이 */
	private int popupImageHeight;
	
	
	
}
