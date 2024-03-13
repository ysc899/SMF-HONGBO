package com.seegene.web.user.task.test.vo;
import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

/** 검사 항목 조회용 커스텀 검색 옵션 */
@Data
public class TestSearchOption extends SearchPaggingCommonPO{
	/** 검사 필드 검색 옵션 */
	private String testInfoOption;
	/** 검사 팀 검색 옵션 */
	private String mediClsOption;
	/** 질환 검색 옵션 */
	private String[] dissClss;
	/** 알파벳 검색용 */
	private String searchAlp;
	
	/** 검색 여부 */
	private String searchFlag = "N";
	
	private String mainSearchFlag = "N";
}