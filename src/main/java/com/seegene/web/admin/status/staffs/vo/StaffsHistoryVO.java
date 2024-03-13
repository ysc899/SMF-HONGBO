package com.seegene.web.admin.status.staffs.vo;

import java.util.Date;

import lombok.Data;

/**
 * 의료진 현황 의료진 약력 테이블
 */
@Data
public class StaffsHistoryVO {

	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;

	/** 현재 여부 */
	private String nowFlag;

	/** 내용 */
	private String content;

	/** 보조 내용 */
	private String comment;

	/** 약력 출력 순서 */
	private int printOrder;

	/** 의료진 마스터 */
	private int staffsSeq;

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


