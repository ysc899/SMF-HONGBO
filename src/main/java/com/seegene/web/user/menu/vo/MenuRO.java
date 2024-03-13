package com.seegene.web.user.menu.vo;

import java.util.List;

import com.seegene.web.admin.menu.user.vo.MenuVO;

import lombok.Data;

/** 사용자 화면에 출력할 메뉴 정보들 */
@Data
public class MenuRO {
	/** 탑메뉴 */
	private List<MenuVO> topMenus;
	/** 퀵메뉴 */
	private List<MenuVO> quickMenus;
}
