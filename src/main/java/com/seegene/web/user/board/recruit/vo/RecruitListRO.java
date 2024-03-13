package com.seegene.web.user.board.recruit.vo;

import java.util.Date;

import lombok.Data;

/**
 * 게시판 채용 테이블
 */
@Data
public class RecruitListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

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

	/** 조회 수 */
	private long hitCnt;

	/** 시작일 */
	private Date startDate;

	/** 종료일 */
	private Date endDate;

}
