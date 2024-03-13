package com.seegene.web.admin.health.vo;

import lombok.Data;

/**
 * 건강정보 등록 정보
 */
@Data
public class HealthInfoAddPO {
	/** 언어 구분 코드 */
	private String codeLang;
	/** 검수자 */
	private String inspector;
	/** 검수자 코멘트 */
	private String inspectorCmt;
	/** 출력 순서 */
	private int printOrder;
	/** 보조타이틀 */
	private String subTitle;
	/** 타이틀 */
	private String title;
	/** 작성자 */
	private String writer;
	/** 출력 여부 */
	private String printFlag;
	
	/** 출처 json */
	private String sourceJSON;
	/** 테스트 정보 json */
	private String testJSON;
	
}
