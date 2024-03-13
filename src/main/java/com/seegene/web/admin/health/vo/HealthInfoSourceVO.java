package com.seegene.web.admin.health.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 건강정보 언어별 출처 내용
 */
@Getter
@Setter
@ToString
public class HealthInfoSourceVO {

	/** 식별자 */
	private int seq;

	/** 출처 */
	private String source;

	/** 출처 url */
	private String url;

	/** 출처 설명 */
	private String comment;

	/** 등록일 */
	private Date regDate;

	/** 건강정보 마스터 seq*/
	private int healthInfoSeq;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserID;

	/** 삭제 여부 */
	private String deleteFlag;

}
