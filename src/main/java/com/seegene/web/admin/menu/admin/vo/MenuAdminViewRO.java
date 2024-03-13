package com.seegene.web.admin.menu.admin.vo;

import java.util.Date;

import lombok.Data;

/**
 * 관리자 메뉴 상세용
 */
@Data
public class MenuAdminViewRO {

	/** 식별자 */
	private int seq;

	/** 메뉴명 */
	private String menuName;

	/** 메뉴 출력 순서 */
	private int menuOrder;

	/** 메뉴 url */
	private String menuUrl;

	/** 부모 메뉴 seq */
	private int parentSeq;
	
	/** 부모 메뉴 이름 */
	private String parentName;
	
	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	/** 최종 수정한 사용자 이름 */
	private String editUserName;

}
