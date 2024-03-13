package com.seegene.web.admin.inspection.request.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검사 의뢰서
 */
@Data
public class InspectionRequestVO {

	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 타이틀 */
	private String title;

	/** 파일 저장 경로 */
	private String filePath;

	/** 섬네일 여부 */
	private String thumFlag;

	/** 섬네일 저장 경로 */
	private String thumFilePath;

	/** 파일 이름 */
	private String fileName;
	
	/** 출력 순서 */
	private int printOrder;

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
