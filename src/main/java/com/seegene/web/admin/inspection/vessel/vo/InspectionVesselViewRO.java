package com.seegene.web.admin.inspection.vessel.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검체용기 상세 RO
 */
@Data
public class InspectionVesselViewRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;


	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;

	/** 검사항목 */
	private String inspectionName;

	/** 보관 조건 코드 */
	private String codeVesselscType;
	private String codeVesselscName;

	/** 참고사항 */
	private String comment;

	/** 이미지 경로 */
	private String filePath;
	private String fileContent;
	
	private int printOrder;


	/** 최종 수정일 */
	private Date editDate;
	/** 최종 수정한 사용자 */
	private String editUserId;
	private String editUserName;

}
