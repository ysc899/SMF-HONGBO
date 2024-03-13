package com.seegene.web.admin.user.vo;

import java.util.List;

import javax.persistence.Entity;

import com.seegene.web.admin.menu.admin.vo.MenuAdminVO;
import com.seegene.web.admin.role.vo.AdminRoleVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 관리자 상세 조회 결과용
 */
@Getter
@Setter
@ToString
public class AddAdminDefaultInfoRO {

	/** 모든 메뉴 정보들 */
	private List<MenuAdminVO> menus;
	/** 권한 그룹 정보들 */
	private List<AdminRoleVO> roles;

	
}
