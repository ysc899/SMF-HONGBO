package com.seegene.web.admin.inspection.request.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검사 의뢰서 리스트 RO
 */
@Data
public class InspectionRequestListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 타이틀 */
	private String title;

	/** 섬네일 여부 */
	private String thumFlag;

	/** 출력 순서 */
	private int printOrder;

	/** 최종 수정일 */
	private Date editDate;

}
