package com.seegene.web.auth.vo;

import lombok.Data;

/**
 * 일반 사용자 로그인용 RO
 */
@Data
public class UserLoginRO {
	/** 결과 코드 */
	private int code;
	/** 호출 url */
	private String callUrl;
	
}
