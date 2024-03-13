package com.seegene.web.user.customer.healthinfo.vo;

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
public class HealthInfoUserViewRO {
	
	/** 식별자 */
	private int seq;
	
	private String title;
	/** 내용 파일 경로 */
	private String imgContentPath;
	/** 내용 파일 base64 */
	private String imgContent;
	
	/** 건강정보 작성자 */
	private String writer;

	/** 검수자 */
	private String inspector;

	/** 검수자 설명 */
	private String inspectorCmt;
	
	private int printOrder;

	/** 출처 정보 */
	private List<HealthInfoUserSourcePO> sources;
	/** 검사 항목 */
	private List<HealthInfoUserTestHardInfoPO> tests;
	
	private HealthInfoUserNextPreRO next;
	
	private HealthInfoUserNextPreRO pre;


}
