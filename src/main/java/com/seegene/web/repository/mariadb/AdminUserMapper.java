package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.user.vo.AdminUserMenuMappingVO;
import com.seegene.web.admin.user.vo.AdminUserVO;
import com.seegene.web.admin.user.vo.MainAdminMenuRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper()
public interface AdminUserMapper {
	/** 로그인용 사용자 정보 조회 */
	AdminUserVO selectByUserId(String userId);
	/** 관리자 메뉴 리스트 */
	List<MainAdminMenuRO> findByMainAdminUserMenus(String userId);
	/** 관리자 최종 로그인 시간 업데이트 */
	void updateLastLogin(String userId);
	/** 관리자 리스트 조회 */
	List<AdminUserVO> findAdminList(SearchPaggingCommonPO param);
	/** 관리자 리스트 카운트 */
	int countAdminList(SearchPaggingCommonPO param);
	/** 관리자 상세 조회 */
	AdminUserVO findAdminInfo(String userId);
	/** 관리자 id 중복 확인 */
	int countUserId(String userId);
	/** 관리자 사용자 등록 */
	int addAdminUser(AdminUserVO param);
	/** 관리자가 사용할 메뉴 권한 등록 */
	int addAdminUserMenu(List<AdminUserMenuMappingVO> param);
	/** 해당 사용자의 메뉴 리스트 조회 */
	List<AdminUserMenuMappingVO> findAllUserMenu(String userId);
	/** 관리자 삭제 처리 */
	void deleteAdminUser(AdminUserVO param);
	/** 관리자 수정 */
	void editAdminUser(AdminUserVO param);
	/** 관리자 메뉴 삭제 처리 */
	void deleteAllUserMenu(AdminUserVO param);
	/** 내정보 수정 */
	void editMyInfo(AdminUserVO param);
}
