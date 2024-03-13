package com.seegene.web.admin.faq.manage.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFaQMasterVO {
	/** 식별자 */
	private int seq;

	/** 자주하는 질문 게시판 이름 */
	private String masterName;

	/** 자주하는 질문 게시판 설명 */
	private String masterDesc;

	/** 언어 타입 코드 */
	private String codeLangType;

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

