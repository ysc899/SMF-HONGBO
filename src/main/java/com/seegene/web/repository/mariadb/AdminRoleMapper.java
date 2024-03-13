package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.role.vo.AdminRoleMenuMappingVO;
import com.seegene.web.admin.role.vo.AdminRoleMenuRO;
import com.seegene.web.admin.role.vo.AdminRoleVO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 관리자 권한 그룹 맵퍼
 */
@Mapper()
public interface AdminRoleMapper {
	
	/**
	 * @param roleName 롤명
	 * @return 롤 정보
	 */
	AdminRoleVO findRoleByRoleName(String roleName);
	
	/**
	 * @param roleName 롤명
	 * @return 롤 메뉴 리스트
	 */
	List<AdminRoleMenuMappingVO> findMenuAllInfoByRoleName(String roleName);
	
	/**
	 * 
	 * @param roleName 롤 명
	 * @return 롤 상세 정보
	 */
	AdminRoleVO findRoleInfo(String roleName);
	
	/**
	 * @return 모든 관리자 권한 그룹 리스트
	 */
	List<AdminRoleVO> findAllAdminRole();
	
	/**
	 * @param roleName 롤 이름
	 * @return 롤 이름에 대한 메뉴 리스트
	 */
	List<AdminRoleMenuMappingVO> findRoleMenuByRoleName(String roleName);
	
	/** 권한 검색 리스트 */
	List<AdminRoleVO> findRoleList(SearchPaggingCommonPO param);
	/** 권한 검색 리스트 카운트 */
	int countRoleList(SearchPaggingCommonPO param);
	
	/**
	 * @param roleName 롤 이름
	 * @return 롤의 메뉴 정보
	 */
	List<AdminRoleMenuRO> findRoleMenuInfoByRoleName(String roleName);
	
	/**
	 * @param roleName 롤 이름
	 * @return 롤이름 카운트
	 */
	int countRoleName(String roleName);
	
	/**
	 * @param param 롤 등록 정보
	 */
	void addRoleInfo(AdminRoleVO param);

	/**
	 * @param addRoleMenus 롤에 등록될 메뉴 정보
	 */
	void addRoleMenu(List<AdminRoleMenuMappingVO> addRoleMenus);

	/**
	 * @param deleteParam 롤 삭제 정보
	 */
	void deleteRole(AdminRoleVO deleteParam);

	/**
	 * @param item 롤 수정 정보
	 */
	void editRole(AdminRoleVO item);

	/**
	 * @param item 삭제할 롤 메뉴 정보
	 */
	void deleteAllRoleMenu(AdminRoleVO item);
}
