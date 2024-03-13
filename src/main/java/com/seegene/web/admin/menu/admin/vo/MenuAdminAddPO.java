package com.seegene.web.admin.menu.admin.vo;

import lombok.Data;

/**
 * 관리자 메뉴 등록용
 */
@Data
public class MenuAdminAddPO {
	
	/** 메뉴명 */
	private String menuName;

	/** 메뉴 출력 순서 */
	private int menuOrder;

	/** 메뉴 url */
	private String url;

	/** 부모 메뉴 seq */
	private int parent;

}
