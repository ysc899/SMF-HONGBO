package com.seegene.web.admin.status.certification.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CertificationListRO {
	
	private int row;
	
	/** 식별자 */
	private int seq;

	private String codeCenterType;
	private String codeCenterName;

	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;
	
	private String codeCertLocName;

	/** 분류 */
//	private String category;
	/** 카테고리명 */
	private String codeCertName;

	/** 타이틀 */
	private String title;


	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;

	/** 최종 수정일 */
	private Date editDate;


}

