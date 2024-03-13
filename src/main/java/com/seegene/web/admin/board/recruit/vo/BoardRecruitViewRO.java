package com.seegene.web.admin.board.recruit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 게시판 채용 상세 ro
 */
@Data
public class BoardRecruitViewRO {

	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 언어 타입 코드 명 */
	private String codeLangName;

	/** 채용 종류 코드 */
	private String codeRecruitType;
	/** 채용 종류 코드  명 */
	private String codeRecruitName;

	/** 채용 상태 코드 */
	private String codeRecruitStateType;
	
	/** 채용 상태 코드  명*/
	private String codeRecruitStateName;

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

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
	private String editUserName;
	
	/** 업무들 */
	private List<BoardRecruitTaskVO> tasks;

}