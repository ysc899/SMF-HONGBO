package com.seegene.web.admin.board.recruit.vo;

import java.util.Date;

import lombok.Data;

/**
 * 채용 정보 채용 부문
 */
@Data
public class BoardRecruitTaskVO {

	/** 식별자 */
	private int seq;

	/** 채용 부문 */
	private String taskSection;

	/** 채용 지역 */
	private String taskLoc;

	/** 담당 업무 */
	private String taskAssigned;
	
	/** 근무 시간 */
	private String taskTime;

	/** 필수요건 */
	private String taskRequire;

	/** 우대요건 */
	private String taskOption;

	/** 인원 */
	private String taskApes;

	/** 채용 마스터 */
	private int boardRecruitSeq;

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
