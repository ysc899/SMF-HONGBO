package com.seegene.web.admin.inspection.test.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검사항목 수정 정보 테이블
 */
@Data
public class InspectionTestEditLogRO {

	/** 식별자 */
	private int seq;

	/** 상태 코드 */
	private String codeEditStType;
	
	private String codeEditStName;

	/** 등록일 */
	private Date regDate;
	/** 최초 등록한 사용자 */
	private String regUserId;
	private String regUserName;

}
