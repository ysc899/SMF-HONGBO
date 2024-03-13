package com.seegene.web.admin.user.vo;

import lombok.Data;

/**
 * 관리자 데이터 입력시 사용할 po
 */
@Data
public class AdminUserPO {

	/** id */
	private String userId;

	/** 이름 */
	private String name;

	/** 비밀번호 */
	private String password;
	
	/** 비밀번호 확인*/
	private String checkPassword;

	/** 연락처 */
	private String contact;

	/** 이메일 */
	private String email;

	/** 메모 */
	private String comment;
	
	/** 읽기 권한 들 */
	private int[] readSeqs;
	/** 쓰기 권한 들 */
	private int[] writeSeqs;
	/** 부모 메뉴들 */
	private int[] parentSeqs;
	
}
