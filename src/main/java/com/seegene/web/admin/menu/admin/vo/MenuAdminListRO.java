package com.seegene.web.admin.menu.admin.vo;

import java.util.Date;

import lombok.Data;

/**
 * 관리자 메뉴 list 용 RO
 */
@Data
public class MenuAdminListRO {
	
	/** 로우 번호 */
	private int row;
	
	/** 식별자 */
	private int seq;
	
	/** 메뉴명 */
	private String menuName;
	
	/** 상위 메뉴 명 */
	private String parentName;
	
	/** 메뉴 출력 순서 */
	private int menuOrder;
	
	/** 최종 수정일 */
	private Date editDate;
	
}
