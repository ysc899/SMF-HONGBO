package com.seegene.web.user.inspection.staffs.vo;

import lombok.Data;

/**
 * 의료진현황에 기본적으로 필요한 데이터
 */
@Data
public class StaffsUserListRO {

	/** 식별자 */
	private int seq;

	/** 센터 타입 코드 */
	private String codeCenterType;

	/** 부서 타입 코드 */
	private String codePartType;

	/** 대표원장 여부 */
	private String masterFlag;
	
	private String thumImagePath;
	private String thumImageContent;
	
	private int printOrder;
	
	/** 직위 */
	private String position;

	/** 이름 */
	private String name;

	/** 학위 */
	private String degree;

	/** 전문분야 */
	private String specialty;
	
	private int historyCount;
	
}
