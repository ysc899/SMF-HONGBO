package com.seegene.web.admin.board.db2.vo;

import lombok.Data;

@Data
public class Db2BoardMappingVO {
	private int seq;
	/** 게시물 seq */
	private int boardSeq;
	/** 문서종류 공문 : OFF_DOCU, 새소식 : NOTICE */
	private String boardType;
	/** 시스템 구분 */
	private long s014seq;
	
}
