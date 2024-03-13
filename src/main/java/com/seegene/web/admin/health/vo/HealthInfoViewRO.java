package com.seegene.web.admin.health.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 관리자 원클릭 건강정보 상세 RO
 */
@Getter
@Setter
@ToString
public class HealthInfoViewRO {
	
	/** 식별자 */
	private int seq;

	/** 언어코드 타입 */
	private String codeLangType;
	
	/** 언어 타입 코드 */
	private String codeLangName;

	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;
	
	/** 타이틀 섬네일 이미지 경로 */
	private String imgThumFlag;
	
	/** 타이틀 섬네일 이미지 경로 */
	private String imgTitleThumPath;

	/** 이미지 파일 base54 */
	private String imgTitleThumBase64;
	
	/** 내용 파일 경로 */
	private String imgContentFlag;
	
	/** 내용 파일 경로 */
	private String imgContentPath;
	
	/** 내용 파일 base64 */
	private String imgContentBase64;
	
	/** 건강정보 작성자 */
	private String writer;

	/** 검수자 */
	private String inspector;

	/** 검수자 설명 */
	private String inspectorCmt;

	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	/** 최종 수정한 사용자 이름*/
	private String editUserName;
	
	/** 출처 정보 */
	private List<HealthInfoSourceVO> sources;
	/** 검사 항목 */
	private List<HealthInfoTestListRO> tests;


}
