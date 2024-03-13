package com.seegene.web.admin.health.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 건강정보 관련 검사 코드
 */
@Getter
@Setter
@ToString
public class HealthInfoTestCodeVO {

	/** 식별자 */
	private int seq;

	/** 검사코드 */
	private String testCode;

	/** 건강정보 마스터 seq*/
	private int healthInfoSeq;
	
	/** 검사명 */
	private String testName;
	
	/** 코멘트 */
	private String comment;

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

	private int paddingSecond;
}
