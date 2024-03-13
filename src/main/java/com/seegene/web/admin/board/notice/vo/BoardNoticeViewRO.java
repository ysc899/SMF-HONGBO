package com.seegene.web.admin.board.notice.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 공문 상세용
 */
@Data
public class BoardNoticeViewRO {
	
	/** 식별자 */
	private int seq;

	/** 센터 종류 타입 코드 */
	private String codeCenterType;
	
	/** 센터 종류 타입 이름 */
	private String codeCenterName;

	/** 언어 타입 코드 */
	private String codeLangType;
	
	/** 언어 타입 이름 */
	private String codeLangName;
	
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
	
	/** 최종 수정일 */
	private Date editDate;
	
	/** 최종 수정자 ID */
	private String editUserId;
	/** 최종 수정자 이름 */
	private String editUserName;
	/** 첨부파일 리스트 */
	private List<BoardNoticeFileViewRO> fileList;
	
	/** 로그인여부 */
	private String loginYn;
}
