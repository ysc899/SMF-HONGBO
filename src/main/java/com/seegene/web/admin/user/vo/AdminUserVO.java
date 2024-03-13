package com.seegene.web.admin.user.vo;

import java.util.Date;

import lombok.Data;

/**
 * 관리자 VO
 * TODO 추후 일반 로그인 일때 생각해야함
 */
@Data
public class AdminUserVO {
	/** 로우 번호 */
	private int row;

	/** id */
	private String userId;

	/** 이름 */
	private String name;

	/** 비밀번호 */
	private String password;

	/** 연락처 */
	private String contact;

	/** 이메일 */
	private String email;

	/** 메모 */
	private String comment;
	
	/** 최종 접속 일시 */
	private Date lastLoginDate;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제여부 */
	private String deleteFlag;
	
	/** 최종 수정자 이름 */
	private String editUserName;
	
}
