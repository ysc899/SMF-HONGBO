package com.seegene.web.user.customer.payrollNotice.vo;

import lombok.Data;

/**
 * 공문에 리스트 객체
 */
@Data
public class PayrollViewNextPreRO {

	/** 식별자 */
	private int seq;

	/** 파일 이름 */
	private String title;
	/** 이전 다음 타입 */
	private String type;
	
}
