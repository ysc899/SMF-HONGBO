package com.seegene.web.admin.main.popup.vo;

import java.util.Date;

import lombok.Data;

/**
 * 로고 관리 리스트용
 */
@Data
public class MainPopupListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;
	
	/** 로그인 여부 타입 코드 */
	private String codeLoginType;
	private String codeLoginName;
	
	private String title;
	/** 시작일 */
	private Date startDate;

	/** 종료일 */
	private Date endDate;
	
	/** 출력 여부 */
	private String printFlag;

	/** 최종 수정일 */
	private Date editDate;
	
}
