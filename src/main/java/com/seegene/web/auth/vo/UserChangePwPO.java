package com.seegene.web.auth.vo;

import lombok.Data;

/**
 * 일반 사용자  비밀번호 변경용 po
 */
@Data
public class UserChangePwPO {
	/** id */
	private String userId;
	
	private String nowPw;
	/** pw */
	private String newPw;
	
	private String newPwCheck;
	
}
