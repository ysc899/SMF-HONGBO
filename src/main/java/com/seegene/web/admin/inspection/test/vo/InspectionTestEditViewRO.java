package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

import java.util.Date;

/**
 * 검사항목 수정 정보 테이블
 */
@Data
public class InspectionTestEditViewRO {

	/** 식별자 */
	private int seq;

	/** 상태 코드 */
	private String codeEditStType;
	private String codeEditStName;

	/** 검사코드 */
	private String f010gcd;
	
	/** 검사명 */
	private String testName;

	/** 보존 방법 */
	private String t001sav;
//	/** 검사일 */
//	private String t001day;

	/** 임상정보 */
	private String t001cont;

	/** 주의사항 */
	private String t001etc;

	/** 참고치 */
	private String t001ref;

	/** 참고치 */
	private String t001url;

	/** 등록일 */
	private Date regDate;
	private Date editDate;

	/** 최초 등록한 사용자 */
	private String regUserId;
	private String regUserName;
	
	/** 최초 등록한 사용자 */
	private String editUserId;
	private String editUserName;

}
