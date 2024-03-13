package com.seegene.web.admin.board.notice.vo;

import lombok.Data;

/**
 * 공문 등록용 PO
 */
@Data
public class BoardNoticeAddPO {
	

	/** 센터 종류 타입 코드 */
	private String codeLang;

	/** 언어 타입 코드 */
	private String codeCenter;
	
	/** 타이틀 */
	private String title;
	
	/** 공문번호 */
	private String noticeNumber;
	/** 게시물 내용 */
	private String content;
	
	/** 공지여부 여부 */
	private String noticeFlag;

	/** 로그인 여부 */
	private String loginYn;
}
