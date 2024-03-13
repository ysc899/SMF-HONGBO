package com.seegene.web.admin.inspection.test.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검사 승인 항목 리스트용 RO
 */
@Data
public class InspectionListRO {
	private int row;
	
	/** 식별자 */
	private int seq;

	/** 상태 코드 */
	private String codeEditStType;
	private String codeEditStName;
	
	/** 검사코드 */
	private String f010gcd;
	
	private String testName;
	
	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;
	private String regUserName;
	
}

