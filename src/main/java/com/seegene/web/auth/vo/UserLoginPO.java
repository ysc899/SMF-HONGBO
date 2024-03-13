package com.seegene.web.auth.vo;

import lombok.Data;

/**
 * 일반 사용자 로그인용 po
 */
@Data
public class UserLoginPO {
	/** id */
	private String userId;
	/** pw */
	private String pwd;
	
}
