package com.seegene.web.admin.inspection.vessel.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검체용기 리스트 RO
 */
@Data
public class InspectionVesselListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 타이틀 */
	private String title;

	/** 검사항목 */
	private String inspectionName;

	/** 최종 수정일 */
	private Date editDate;

}
