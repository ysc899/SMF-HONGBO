package com.seegene.web.admin.board.recruit.vo;

import lombok.Data;

/**
 * 게시판 채용 수정 파라미터
 */
@Data
public class BoardRecruitEditPO extends BoardRecruitAddPO{

	/** 식별자 */
	private int seq;
	
	/** 삭제된 업무 내용 JSON */
	private String deleteTaskJSON;
	
}
