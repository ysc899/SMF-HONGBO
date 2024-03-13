package com.seegene.web.admin.status.history.vo;

import java.util.Date;

import lombok.Data;

/**
 * 연혁 마스터 테이블
 */
@Data
public class HistoryVO {

	/** 식별자 */
	private int seq;

	/** 연혁 년 */
	private String year;

	/** 연혁 월 */
	private String month;

	/** 연혁 종료 년 */
	private String endYear;
	
	/** 언어 타입 코드 */
	private String codeLangType;

	/** 연혁 내용 */
	private String content;

	/** 연혁 출력 순서 */
	private int printOrder;

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

}
