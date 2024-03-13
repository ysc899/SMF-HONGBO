package com.seegene.web.admin.inspection.test.vo;

import java.util.List;

import lombok.Data;

/**
 * 검사 항목 조회 리스트에서 사용할 기본 검색 옵션들
 */
@Data
public class InspectionTestListDefaultRO {
	
	/** 검색 옵션 필드 */
	private List<DB2CodeRO> testInfos;
	/** 검사학부 코드 */
	private List<DB2CodeRO> mediClss;
	/** 질환 관련 코드*/
	private List<DB2CodeRO> dissClss;
	
}

