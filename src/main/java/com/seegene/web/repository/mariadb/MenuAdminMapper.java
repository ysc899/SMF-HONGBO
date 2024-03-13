package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.menu.admin.vo.MenuAdminSelectParentRO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminListRO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminVO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper()
public interface MenuAdminMapper {
	/**
	 * @return 관리자 메뉴 리스트
	 */
	List<MenuAdminVO> findAllAdminMenu();
	
	/** 단일 메뉴 조회 */
	MenuAdminVO findBySeq(int seq);
	
	/** 관리자 메뉴 조회 리스트 */
	List<MenuAdminListRO> findAdminMenuList(SearchPaggingCommonPO param);
	/** 관리자 메뉴 조회 리스트 카운트 */
	int countAdminMenuList(SearchPaggingCommonPO param);
	/** 관리자 메뉴 상세 조회용 */
	MenuAdminViewRO findAdminMenuInfo(int seq);
	/** 관리자 메뉴 부모 선택용 */
	List<MenuAdminSelectParentRO> findAdminMenuParent();
	/** 메뉴 로그 용 */
	List<MenuAdminVO> checkMenuOrder(MenuAdminVO param);
	/** 메뉴 출력 순서 증가 업데이트 용 */
	void updateMenuOrderInc(MenuAdminVO param);
	/** 메뉴 출력 순서 감소 업데이트 용 */
	void updateMenuOrderDec(MenuAdminVO param);
	/** 관리자 메뉴 등록 */
	void addMenuAdmin(MenuAdminVO param);
	/** 관리자 메뉴 수정 */
	void editMenu(MenuAdminVO param);
	/** 관리자 메뉴 삭제 */
	void deleteMenu(MenuAdminVO param);
	
}
