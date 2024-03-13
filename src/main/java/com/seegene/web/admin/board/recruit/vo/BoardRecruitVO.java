package com.seegene.web.admin.board.recruit.vo;

import java.util.Date;

import lombok.Data;

/**
 * 게시판 채용 테이블
 */
@Data
public class BoardRecruitVO {

	/** 식별자 */
	private int seq;

//	/** 센터 종류 타입 코드 */
//	@Column(name = "CODE_CENTER_TYPE", nullable = false, length = 10)
//	private String centerType;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 채용 종류 코드 */
	private String codeRecruitType;

	/** 채용 상태 코드 */
	private String codeRecruitStateType;

	/** 타이틀 */
	private String title;

	/** 게시물 내용 */
	private String content;

	/** 내용 타이틀 */
	private String contentTitle;

	/** 내용 보조 문구 */
	private String contentComment;

	/** 조회 수 */
	private long hitCnt;

	/** 표시 여부 */
	private String viewFlag;

	/** 신규 방식 여부 */
	private String inputTypeFlag;

	/** 시작일 */
	private Date startDate;

	/** 종료일 */
	private Date endDate;

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
