package com.seegene.web.admin.inspection.request.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 검사의뢰서 등록 기본 정보
 */
@Data
public class InspectionRequestAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
}
