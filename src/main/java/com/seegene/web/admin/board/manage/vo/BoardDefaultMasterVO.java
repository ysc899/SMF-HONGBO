package com.seegene.web.admin.board.manage.vo;

import java.util.Date;

import lombok.Data;

/**
 * 통합 게시판 마스터
 */
@Data
public class BoardDefaultMasterVO {
	
	/** 식별자 */
	private int seq;

	/** 통합 게시판 이름 */
	private String masterName;

	/** 톱합 게시판 설명 */
	private String masterDesc;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 섬네일 사용 여부 */
	private String optThumFlag;
	
	/** 첨부파일 사용 여부 */
	private String optFileFlag;
	
	/** 공지글 사용 여부 */
	private String optNotiFlag;
	
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

