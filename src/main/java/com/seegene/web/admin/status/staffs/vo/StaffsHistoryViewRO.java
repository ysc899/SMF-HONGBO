package com.seegene.web.admin.status.staffs.vo;

import java.util.Date;

import lombok.Data;

/**
 * 의료진 현황 상세보기용 약력
 */
@Data
public class StaffsHistoryViewRO {

	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 현재 여부 */
	private String nowFlag;

	/** 내용 */
	private String content;

	/** 보조 내용 */
	private String comment;

	/** 약력 출력 순서 */
	private int printOrder;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	private String editUserName;

}


