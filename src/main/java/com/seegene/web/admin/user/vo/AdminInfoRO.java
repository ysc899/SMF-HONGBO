package com.seegene.web.admin.user.vo;

import java.util.List;

import javax.persistence.Entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 관리자 상세 조회 결과용
 */
@Getter
@Setter
@ToString
public class AdminInfoRO {

	/** 사용자 정보 */
	private AdminUserVO user;
	/** 사용자에게 할당된 메뉴들 정보 */
	private List<MainAdminMenuRO> userMenus;

	
}
