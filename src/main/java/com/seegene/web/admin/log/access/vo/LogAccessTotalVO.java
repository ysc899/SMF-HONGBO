package com.seegene.web.admin.log.access.vo;

import lombok.Data;

/**
 * 접속 로그 집계 테이블
 */
@Data
public class LogAccessTotalVO {

	/** 식별자 */
	private long seq;

	/** 로그 년도 */
	private String logYear;

	/** 로그 월 */
	private String logMonth;

	/** 로그 일 */
	private String logDay;

	/** 접근 사용자 ID */
	private String userID;

	/** 접근 메뉴 */
	private int menuSeq;

	/** 접속 횟수 */
	private long accessCount;

}
