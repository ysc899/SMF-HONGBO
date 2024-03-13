package com.seegene.web.admin.status.certification.vo;

import lombok.Data;

/**
 * 인증현황 등록 파라미터
 */
@Data
public class CertificationAddPO {
	/** 언어 구분 코드 */
	private String codeLang;
	
	/** 분류 */
	private String codeCertType;
	
	private String codeCenterType;
	
	/** 국내 국외 타입 코드 */
	private String codeCertLocType;
	
	/** 타이틀 */
	private String title;

	/** 발급기간 */
	private String issuingAgency;

	/** 인증내역 */
	private String content;

	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;
}
