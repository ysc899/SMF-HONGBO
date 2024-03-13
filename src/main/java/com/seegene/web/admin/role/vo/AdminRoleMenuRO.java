package com.seegene.web.admin.role.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 권한 상세 메뉴 뷰용
 */
@Getter
@Setter
@ToString
public class AdminRoleMenuRO implements Comparable<AdminRoleMenuRO>{

	/** 식별자 */
	private int seq;
	
	/** 메뉴명 */
	private String menuName;

	/** 메뉴 출력 순서 */
	private int menuOrder;

	/** 관리자 메뉴 seq */
	private int menuAdminSeq;
	/** 상위 메뉴 seq */
	private int menuParentSeq;

	/** 읽기 여부 */
	private String readFlag;

	/** 쓰기 여부 */
	private String writeFlag;

	/** 상위 메뉴 */
	private AdminRoleMenuRO parent;
	
	private List<AdminRoleMenuRO> childs;
	
	@Override
	public int compareTo(AdminRoleMenuRO o) {
		return Integer.compare(this.menuOrder, o.getMenuOrder());
	}

}
