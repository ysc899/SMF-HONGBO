package com.seegene.web.admin.menu.admin.vo;

import java.util.List;

import lombok.Data;

/**
 * 관리자 메뉴 등록용 RO
 */
@Data
public class AddMenuAdminDefaultInfoRO {

	private List<MenuAdminSelectParentRO> parentList;
	
	
}
