package com.seegene.web.admin.board.manage.vo;

import java.util.Date;

import lombok.Data;

/**
 * 통합 게시판 관리 리스트용 RO
 */
@Data
public class BoardManageListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 자주하는 질문 게시판 이름 */
	private String masterName;

	/** 언어 타입 코드 */
	private String codeLangType;
	/** 언어 타입 코드 명*/
	private String codeLangName;
	
	/** 게시글 수 */
	private int contentCount;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

}

