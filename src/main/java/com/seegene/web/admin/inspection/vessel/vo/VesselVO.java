package com.seegene.web.admin.inspection.vessel.vo;

import java.util.Date;

import lombok.Data;

/**
 * 검체 용기 테이블
 */
@Data
public class VesselVO {
	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;

	/** 검사항목 */
	private String inspectionName;

	/** 보관 조건 코드 */
	private String codeVesselscType;

	/** 참고사항 */
	private String comment;

	/** 이미지 경로 */
	private String filePath;

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
