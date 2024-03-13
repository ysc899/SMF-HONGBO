package com.seegene.web.admin.health.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 건강정보 등록 기본 정보
 */
@Data
public class HealthInfoAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	
	/** 출력 뷰 카운트 */
	private int maxPrintOrder;
}
