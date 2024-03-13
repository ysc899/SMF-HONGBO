package com.seegene.web.admin.main.logo.vo;

import java.util.Date;

import lombok.Data;

/**
 * 메인 로고 관련 테이블
 */
@Data
public class MainLogoVO {

	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	
	/** 관리자용 식별자 */
	private String name;
	
	/** 로고 종류 코드 */
	private String codeLogoType;
	
	/** URL */
	private String url;

	/** 파일 저장 경로 */
	private String filePath;

	/** 파일 이름 */
	private String fileName;

	/** 파일 사이즈 */
	private long fileSize;

	/** 시작일 */
	private Date startDate;

	/** 종료일 */
	private Date endDate;

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
