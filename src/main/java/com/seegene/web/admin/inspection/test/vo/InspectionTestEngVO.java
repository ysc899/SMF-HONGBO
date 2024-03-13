package com.seegene.web.admin.inspection.test.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검사항목 영문 정보 테이블
 */
@Data
public class InspectionTestEngVO {

	/** 식별자 */
	private int seq;

	/** 검사코드 */
	private String f010gcd;

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
	private String t001room;
	
	/** 삭제 여부 */
	private String t001cold;
	
	/** 삭제 여부 */
	private String t001frozen;

}
