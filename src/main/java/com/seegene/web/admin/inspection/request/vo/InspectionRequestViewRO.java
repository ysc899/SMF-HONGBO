package com.seegene.web.admin.inspection.request.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검사 의뢰서 상세 RO
 */
@Data
public class InspectionRequestViewRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 타이틀 */
	private String title;
	
	/** 파일 저장 경로 */
	private String filePath;
	/** 파일 이름 */
	private String fileName;

	/** 섬네일 여부 */
	private String thumFlag;

	/** 섬네일 저장 경로 */
	private String thumFilePath;
	
	/** 섬네일 저장 경로 */
	private String thumFileContent;


	/** 출력 순서 */
	private int printOrder;

	/** 최종 수정일 */
	private Date editDate;
	/** 최종 수정한 사용자 */
	private String editUserId;
	private String editUserName;

}
