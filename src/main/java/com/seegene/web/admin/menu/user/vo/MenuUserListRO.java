package com.seegene.web.admin.menu.user.vo;

import java.util.Date;

import lombok.Data;

/**
 * 사용자 메뉴 관리 리스트용 RO
 */
@Data
public class MenuUserListRO {
	private int row;
	
	/** 식별자 */
	private int seq;

	/** 메뉴명 */
	private String menuName;
	
	/** 메뉴 출력 순서 */
	private int menuOrder;
	/** 상위 메뉴 명 */
	private String parentName;
	
	/** 메뉴 타입 코드 명*/
	private String codeMenuName;
	
	/** 메뉴 언어 타입 코드 명 */
	private String codeLangName;
	
	/** 메뉴 로그인 타입 코드 명 */
	private String codeLoginName;
	
	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
	/** 최종 수정 사용자 명 */
	private String editUserName;
	
}
