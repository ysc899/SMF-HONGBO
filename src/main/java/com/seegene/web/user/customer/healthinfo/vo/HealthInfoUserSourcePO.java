package com.seegene.web.user.customer.healthinfo.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 건강정보 사용자 출처 내용
 */
@Getter
@Setter
@ToString
public class HealthInfoUserSourcePO {

	/** 출처 */
	private String source;

	/** 출처 url */
	private String url;

	/** 출처 설명 */
	private String comment;


}
