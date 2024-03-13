package com.seegene.web.admin.menu.admin.vo;

import lombok.Data;

/**
 * 등록 수정시 사용할 상위 메뉴 선택용
 */
@Data
public class MenuAdminSelectParentRO {
	/** 식별자 */
	private int seq;
	/** 메뉴 명 */
	private String menuName;
	/** 하위 메뉴 갯수 */
	private int cnt;
}
