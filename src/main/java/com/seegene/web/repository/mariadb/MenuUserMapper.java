package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.menu.user.vo.MenuSelectParentListRO;
import com.seegene.web.admin.menu.user.vo.MenuVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper()
public interface MenuUserMapper {
	/** 단일 메뉴 조회 */
	MenuVO findBySeq(int seq);
	/** TODO 추후 마리아 디비 버전 보고 쿼리로 변경 할 것 */
	List<MenuVO> findUserMenuList();
//	
//	/** 관리자 메뉴 조회 리스트 */
//	List<MenuAdminListRO> findAdminMenuList(SearchPaggingCommonPO param);
//	/** 관리자 메뉴 조회 리스트 카운트 */
//	int countAdminMenuList(SearchPaggingCommonPO param);
	/** 사용자 메뉴 상세 조회용 */
	MenuVO findUserMenuInfo(int seq);
	/** 사용자 메뉴 부모 선택용 */
	List<MenuSelectParentListRO> findUserMenuParent(String langCode);
	/** 사용자 메뉴 헤더 메뉴 최상위 카운트  */
	int countUserHeadTopMenu(String langCode);
	/** 사용자 메뉴 헤더 상위 메뉴 카운트 */
	int countUserHeadParentMenu(MenuVO param);
	/** 사용자 메뉴 퀵 메뉴 카운트  */
	int countUserQuickMenu(String langCode);
	/** 자식 메뉴 카운트 */
	int countByChild(int seq);
	/** 메뉴 로그 용 */
	List<MenuVO> checkMenuOrder(MenuVO param);
	/** 메뉴 출력 순서 증가 업데이트 용 */
	void updateMenuOrderInc(MenuVO param);
	/** 메뉴 출력 순서 감소 업데이트 용 */
	void updateMenuOrderDec(MenuVO param);
	/** 사용자 메뉴 등록 */
	void addMenuUser(MenuVO param);
	/** 사용자 메뉴 수정 */
	void editMenu(MenuVO param);
	/** 사용자 메뉴 삭제 */
	void deleteMenu(MenuVO param);
	
	//일반 사용자에서 사용할 SQL
	/** 언어별 메뉴 리스트 조회 */
	List<MenuVO> findUserLangMenuList(String langCode);
	/** 로그인안한 사용자용 */
	List<MenuVO> findUserNonLoginLangMenuList(String langCode);
	
}
