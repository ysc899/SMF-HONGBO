package com.seegene.web.admin.board.recruit.vo;

import lombok.Data;

/**
 * 게시판 채용 등록 파라미터
 */
@Data
public class BoardRecruitAddPO {


	/** 언어 타입 코드 */
	private String codeLang;

	/** 채용 상태 코드 */
	private String codeRecruitST;

	/** 채용 상태 코드드 */
	private String codeRecruitTP;

	/** 타이틀 */
	private String title;

	/** 표시 여부 */
	private String viewFlag;
	
	/** 입력방식 여부 */
	private String inputTypeFlag;

	/** 시작일 */
	private String startDate;

	/** 종료일 */
	private String endDate;
	
	/** 내용 */
	private String content;
	
	/** 내용 타이틀 */
	private String contentTitle;
	
	/** 채용 부문 */
	private String contentComment;
	
	/** 업무내용 JSON */
	private String taskInfoJSON;
	


}
