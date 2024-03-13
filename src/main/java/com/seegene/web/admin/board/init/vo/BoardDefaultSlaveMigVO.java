package com.seegene.web.admin.board.init.vo;

import lombok.Data;

/**
 * 통합 게시판 내용
 */
@Data
public class BoardDefaultSlaveMigVO {
	/** 식별자 */
	private int seq;

	/** 통합게시판 마스터 */
	private int boardDefaultMasterSeq;

	/** 타이틀 */
	private String title;

	/** 게시물 내용 */
	private String content;

	/** 조회 수 */
	private long hitCnt;

	/** 공지여부 여부 */
	private String noticeFlag;


	/** 등록일 */
	private String regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

}

