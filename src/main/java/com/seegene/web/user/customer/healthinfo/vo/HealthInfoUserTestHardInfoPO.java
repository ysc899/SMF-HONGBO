package com.seegene.web.user.customer.healthinfo.vo;

import lombok.Data;

import java.util.Date;

/**
 * 건강정보 사용자용 관련 검사 객체
 */
@Data
public class HealthInfoUserTestHardInfoPO implements Comparable<HealthInfoUserTestHardInfoPO> {

	/** 식별자 */
	private int seq;

	/** 검사코드 */
	private String testCode;

	/** 검사명 */
	private String testName;
	
	/** 코멘트 */
	private String comment;

	/** 검체 */
	private String specimen;

	/** 용량 */
	private String volume;

	/** 검사 방법 */
	private String testMethod;

	/** 검사일 */
	private String testDay;

	/** 소요일 */
	private String processDay;
	
	private String hardFlag;

	private Date regDate;

	@Override
	public int compareTo(HealthInfoUserTestHardInfoPO o) {
		return Long.compare(regDate.getTime(), o.getRegDate().getTime());
	}
}
