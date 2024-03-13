package com.seegene.web.admin.status.certification.vo;

import java.util.Date;

import lombok.Data;

/**
 * 인증 현황
 */
@Data
public class CertificationVO {

	/** 식별자 */
	private int seq;

	/** 이미지 경로 */
	private String filePath;
	/** 파일 이름 */
	private String fileName;

	/** 섬네일 경로 */
	private String thumFilePath;

	/** 언어 타입 코드 */
	private String codeLangType;
	
	/** 센터 타입 코드 */
	private String codeCenterType;
	
	/** 국내 국외 타입 코드 */
	private String codeCertLocType;

	/** 분류 */
//	private String category;
	/** 분류 타입 코드 */
	private String codeCertType;

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

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;

}
