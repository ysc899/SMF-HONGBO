package com.seegene.web.user.customer.healthinfo.vo;

import lombok.Data;

/**
 * 건강정보 이전 다음 리스트 객체
 */
@Data
public class HealthInfoUserNextPreRO {

	/** 식별자 */
	private int seq;
	/** 이전 다음 타입 */
	private String type;
	
}
