package com.seegene.web.admin.status.staffs.vo;

import java.util.Date;

import lombok.Data;

/**
 * 의료진 현황 리스트용
 */
@Data
public class StaffsListRO {
	
	private int row;
	
	/** 식별자 */
	private int seq;

	/** 센터 타입 코드 */
	private String codeCenterType;
	private String codeCenterName;

	/** 부서 타입 코드 */
	private String codePartType;
	private String codePartName;
	/** 대표 원장 여부 */
	private String masterFlag;
	
	/** 의료진 출력 순서 */
	private int printOrder;
	
	// info 테이블
	/** 직위 */
	private String position;
	/** 이름 */
	private String name;
	
	private Date editDate;
}

