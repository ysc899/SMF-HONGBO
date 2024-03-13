package com.seegene.web.user.board.recruit.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

@Data
public class RecruitSearchPO extends SearchPaggingCommonPO{

	/** 채용 구분 코드 */
	private String codeRecruitTP;
	/** 언어 코드 */
	private String codeLangType;
	
}
