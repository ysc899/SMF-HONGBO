package com.seegene.web.admin.health.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * 관리자 원클릭 건강정보 리스트 RO
 */
@Getter
@Setter
public class HealthInfoListRO {
	
	private int row;

	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangName;

	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;

	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;
	
	/** 조회수 */
	private int viewCount;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;


}
