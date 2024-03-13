package com.seegene.web.admin.status.certification.vo;

import lombok.Data;

@Data
public class CertificationViewRO extends CertificationVO{
	
	/** 언어코드명*/
	private String codeLangName;
	/** 카테고리명 */
	private String codeCertName;
	
	private String codeCenterName;
	
	/** 국내 국외 타입 코드 */
	private String codeCertLocName;
	
	/** 파일 내용 */
	private String fileContent;
	/** 섬네일 파일 내용 */
	private String thumFileContent;
	
	/** 최종 수정자 이름 */
	private String editUserName;
	
}

