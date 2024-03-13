package com.seegene.web.admin.status.staffs.vo;

import lombok.Data;

/**
 * 의료진 등록 기본 정보
 */
@Data
public class StaffsAddPO {

	/** 센터 코드 */
	private String codeCenterType;
	/** 부서 코드 */
	private String codePartType;
	/** 출력 순서 */
	private int printOrder;
	/** 대표원장 여부 */
	private String masterFlag;
	
	/** 언어별 의료진 정보 json */
	private String staffsInfoJSON;
	
	/** 언어별 약력 정보 json */
	private String staffsHistoryJSON;
	
}
