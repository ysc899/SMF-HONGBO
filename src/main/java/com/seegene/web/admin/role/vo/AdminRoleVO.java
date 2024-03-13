package com.seegene.web.admin.role.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 관리자 롤
 */
@Getter
@Setter
@ToString
public class AdminRoleVO {
	/** 로우 번호 */
	private int row;
	/** 권한 영문 명 */
	private String roleName;

	/** 권한 설명 */
	private String roleDesc;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
	/** 최종 수정자 이름 */
	private String editUserName;

	/** 삭제여부 */
	private String deleteFlag;

}
