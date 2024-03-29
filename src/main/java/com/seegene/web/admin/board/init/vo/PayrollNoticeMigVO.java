package com.seegene.web.admin.board.init.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 공문 vo
 */
@Getter
@Setter
@ToString
public class PayrollNoticeMigVO {

	/** 식별자 */
	private int seq;

	/** 센터 종류 타입 코드 */
	private String codeCenterType;

	/** 언어 타입 코드 */
	private String codeLangType;
	
	/** 공문번호 */
	private String noticeNumber;
	/** 타이틀 */
	private String title;

	/** 게시물 내용 */
	private String content;

	/** 조회 수 */
	private long hitCnt;

	/** 공지여부 여부 */
	private String noticeFlag;

//	/** 공지사항 파일 리스트 */
//	private List<BoardNoticeFileVO> files;

	/** 등록일 */
	private String regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	
}
