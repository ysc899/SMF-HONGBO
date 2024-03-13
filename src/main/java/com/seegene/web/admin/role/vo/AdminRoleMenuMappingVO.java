package com.seegene.web.admin.role.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 권한 과 관리자 메뉴 맵핑용
 */
@Getter
@Setter
@ToString
public class AdminRoleMenuMappingVO {

	/** 식별자 */
	private int seq;

	/** 권한 종류 */
	private String roleName;

	/** 관리자 메뉴 seq */
	private int menuAdminSeq;

	/** 읽기 여부 */
	private String readFlag;

	/** 쓰기 여부 */
	private String writeFlag;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;
	

}
