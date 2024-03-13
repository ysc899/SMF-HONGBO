package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

/**
 * 검사 승인 항목 상세용 RO
 */
@Data
public class InspectionViewRO {
	
	/** 현재 데이터 */
	private MWT001R2ViewRO asIs;
	/** 변경되는 데이터 */
	private InspectionTestEditViewRO toBe;
	
}

