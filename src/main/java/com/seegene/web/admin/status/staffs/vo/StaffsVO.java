package com.seegene.web.admin.status.staffs.vo;

import java.util.Date;

import lombok.Data;

/**
 * 의료진 현황 의료진 테이블
 */
@Data
public class StaffsVO {

	/** 식별자 */
	private int seq;

	/** 센터 타입 코드 */
	private String codeCenterType;

	/** 부서 타입 코드 */
	private String codePartType;

	/** 대표원장 여부 */
	private String masterFlag;

	/** 의료진 임시 이름 */
	private String name;

	/** 의료진 출력 순서 */
	private int printOrder;

	/** 이미지 경로 */
	private String imagePath;

	/** 섬네일 이미지 경로 */
	private String thumImagePath;

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


