package com.seegene.web.admin.role.vo;

import java.util.List;

import javax.persistence.Entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 롤 상세 조회 결과용
 */
@Getter
@Setter
@ToString
public class RoleInfoRO {

	/** 롤 정보 */
	private AdminRoleVO role;
	/** 롤에게 할당된 메뉴들 정보 */
	private List<AdminRoleMenuRO> roleMenus;

	
}
