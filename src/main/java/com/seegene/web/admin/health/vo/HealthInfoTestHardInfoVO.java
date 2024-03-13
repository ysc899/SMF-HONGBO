package com.seegene.web.admin.health.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 건강정보 관련 검사 정보(수작업 입력) 원클릭 건강정보 검사 코드 수기 정보
 */
@Getter
@Setter
@ToString
public class HealthInfoTestHardInfoVO {

	/** 식별자 */
	private int seq;

	/** 검사코드 */
	private String testCode;

	/** 검사명 */
	private String testName;
	
	/** 코멘트 */
	private String comment;

	/** 검체 */
	private String specimen;

	/** 용량 */
	private String volume;

	/** 검사 방법 */
	private String testMethod;

	/** 검사일 */
	private String testDay;

	/** 소요일 */
	private String processDay;

	
	/** 건강정보 마스터 seq*/
	private int healthInfoSeq;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
	/** 최종 수정한 사용자 이름 */
	private String editUserName;

	/** 삭제 여부 */
	private String deleteFlag;

}
