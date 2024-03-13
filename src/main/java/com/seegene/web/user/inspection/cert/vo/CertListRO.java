package com.seegene.web.user.inspection.cert.vo;

import lombok.Data;

/**
 * 인증현황에 리스트 객체
 */
@Data
public class CertListRO {

	/** 식별자 */
	private int seq;
	
	private String title;
	
	/** 발급기간 */
	private String issuingAgency;

	/** 인증내역 */
	private String content;
	
	private int printOrder;
	
	/** 섬네일 경로 */
	private String thumFilePath;
	private String thumFileContent;
	
	private String codeCertLocType;
	private String codeCertType;
}
