package com.seegene.web.admin.menu.user.vo;

import lombok.Data;

/**
 * 사용자 메뉴 등록용 po
 */
@Data
public class MenuUserAddPO {
	
	/** 언어 타입 코드 */
	private String codeLang;
	/** 메뉴 타입 코드 */
	private String codeMenu;
	/** 로그인 타입 코드 */
	private String codeLogin;
	/** 메뉴 명 */
	private String menuName;
	/** 메뉴 출력 순서 */
	private int menuOrder;
	/** 메뉴 url */
	private String url;
	/** 상위 seq */
	private int parentSeq;
}

