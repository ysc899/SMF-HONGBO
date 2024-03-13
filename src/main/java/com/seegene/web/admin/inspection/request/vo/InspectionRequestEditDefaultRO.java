package com.seegene.web.admin.inspection.request.vo;

import lombok.Data;

/**
 * 검사의뢰서 등록 기본 정보
 */
@Data
public class InspectionRequestEditDefaultRO extends InspectionRequestAddDefaultRO{
	/** 출력 순서 최대값 */
	private int maxOrder;
}
