package com.seegene.web.admin.board.manage.vo;

import java.util.Date;

import lombok.Data;

/**
 * 통합 게시판 관리 뷰용 RO
 */
@Data
public class BoardManageViewRO {

	/** 식별자 */
	private int seq;

	/** 게시판 이름 */
	private String masterName;
	/** 게시판 설명 */
	private String masterDesc;

	/** 언어 타입 코드 */
	private String codeLangType;
	/** 언어 타입 코드 명*/
	private String codeLangName;
	
	/** 게시글 수 */
	private int contentCount;
	
	/** 섬네일 사용 여부 */
	private String optThumFlag;
	
	/** 첨부파일 사용 여부 */
	private String optFileFlag;
	/** 공지글 사용 여부 */
	private String optNotiFlag;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	/** 최종 수정한 사용자 */
	private String editUserName;

}

