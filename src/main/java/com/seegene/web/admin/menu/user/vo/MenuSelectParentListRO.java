package com.seegene.web.admin.menu.user.vo;

import lombok.Data;

/**
 * 사용자 메뉴 부모 메뉴 선택용 RO
 */
@Data
public class MenuSelectParentListRO {

	/** 식별자 */
	private int seq;

	/** 메뉴명 */
	private String menuName;

	/** 메뉴 출력 순서 */
	private int menuOrder;
	/** 메뉴 단계 */
	private int menuLevel;
	/** 상위 메뉴 seq */
	private int parentSeq;

}
