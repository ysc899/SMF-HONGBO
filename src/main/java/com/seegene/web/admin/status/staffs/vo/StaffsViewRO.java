package com.seegene.web.admin.status.staffs.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 의료진 현황 상세 정보
 */
@Data
public class StaffsViewRO {
	
	/** 식별자 */
	private int seq;

	/** 센터 타입 코드 */
	private String codeCenterType;
	private String codeCenterName;

	/** 부서 타입 코드 */
	private String codePartType;
	private String codePartName;
	
	/** 대표원장 여부 */
	private String masterFlag;
	
	/** 의료진 출력 순서 */
	private int printOrder;
	
	/** 이미지 경로 */
	private String imagePath;
	private String imageContent;

	/** 섬네일 이미지 경로 */
	private String thumImagePath;
	private String thumImageContent;
	
	private Date editDate;
	private String editUserId;
	private String editUserName;
	
	/** 의료진 언어별 상세 정보 */
	private List<StaffsInfoViewRO> infoList;
	/** 의료진 약력 정보 */
	private List<StaffsHistoryViewRO> historyList;
	
}

