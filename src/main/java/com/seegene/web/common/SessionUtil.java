package com.seegene.web.common;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.seegene.web.admin.user.vo.MainAdminMenuRO;
import com.seegene.web.auth.vo.AuthUser;

import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

/** 세션 관련 유틸 */
public abstract class SessionUtil {

	public static final int ANONYMOUS = 0;
	
	public static final int USER = 1;
	
	public static final int ADMIN = 2;
	

	/** 기본 생성자 */
	private SessionUtil(){
		
	}
	
	
	/**
	 * 
	 * @return 로그인 여부 반환
	 */
	public static boolean isLogin(){
		
		return EgovUserDetailsHelper.isAuthenticated();
	}
	
	
	/**
	 * @return 사용자 권한 여부 반환
	 */
	public static int getUserRoleType(){
		
		if(!EgovUserDetailsHelper.isAuthenticated()){
			return ANONYMOUS;
		}
		
		List<String> authorities = EgovUserDetailsHelper.getAuthorities();
		if(authorities.contains("ROLE_ADMIN")){
			return ADMIN;
		}else{
			return USER;
		}
	}
	
	/**
	 * @return 로그인 된 사용자 세션 정보
	 */
	public static AuthUser getAuthUser(){
		if(getUserRoleType() == ANONYMOUS){
			return null;
		}
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		AuthUser user = (AuthUser)authentication.getPrincipal();
		return user;
	}
	
	/**
	 * @return 로그인한 사용자 ID 추가
	 */
	public static String getAuthUserId(){
		AuthUser authUser = getAuthUser();
		return authUser.getUsername();
	}
	
	/**
	 * @return 세션의 관리자 메뉴 정보
	 */
	public static List<MainAdminMenuRO> getAdminMenu(){
		if(getUserRoleType() == ADMIN){
			AuthUser authUser = getAuthUser();
			List<MainAdminMenuRO> adminMenus = authUser.getAdminMenus();
			return adminMenus;
		}else{
			return null;
		}
	}
	
	/**
	 * @param url 체크할 url
	 * @return 권한 여부
	 */
	public static boolean checkAdminUserAuth(final String url){
		if(isLogin()){
			List<MainAdminMenuRO> authMenus = getAdminMenu();
			if(authMenus == null){
				return false;
			}
			
			boolean result = false;
			for(MainAdminMenuRO adminMenus : authMenus){
				for(MainAdminMenuRO adminMenu : adminMenus.getChilds()){
					if(url.startsWith(adminMenu.getMenuUrl())){
						if(adminMenu.getWriteFlag().equals("Y")){
							result = true;
							break;
						}else if(adminMenu.getReadFlag().equals("Y")){
							if(url.endsWith(".do") || url.endsWith(".view")){
								result = true;
								break;
							}else{
								break;
							}
						}
					}
				}
			}
			
			return result;
		}else{
			return false;
		}
	}
	
	/**
	 * @param url 확인할 url
	 * @return 현재 메뉴 명
	 */
	public static String getNowMenuName(final String url){
		
		MainAdminMenuRO result = getNowMenu(url);
		if(result == null){
			return "";
		}else{
			return result.getMenuName();
		}
//		String result = "";
//		
//		if(isLogin()){
//			List<MainAdminMenuRO> authMenus = getAdminMenu();
//			if(authMenus == null){
//				return result;
//			}
//			
//			for(MainAdminMenuRO adminMenus : authMenus){
//				for(MainAdminMenuRO adminMenu : adminMenus.getChilds()){
//					if(url.startsWith(adminMenu.getMenuUrl())){
//						if(adminMenu.getWriteFlag().equals("Y")){
//							result= adminMenu.getMenuName();
//							break;
//						}
//					}
//				}
//			}
//		}
//		
//		return result;
		
	}
	
	/**
	 * @param url 확인할 url
	 * @return 현재 메뉴 vo
	 */
	public static MainAdminMenuRO getNowMenu(final String url){
		MainAdminMenuRO result = null;
		
		if(isLogin()){
			List<MainAdminMenuRO> authMenus = getAdminMenu();
			if(authMenus == null){
				return null;
			}
			
			for(MainAdminMenuRO adminMenus : authMenus){
				for(MainAdminMenuRO adminMenu : adminMenus.getChilds()){
					if(url.startsWith(adminMenu.getMenuUrl())){
						if(adminMenu.getWriteFlag().equals("Y")){
							result = adminMenu;
							break;
						}
					}
				}
			}
		}
		return result;
	}
	
	/**
	 * @param url 확인할 url
	 * @return 현재 메뉴 브모 메뉴 vo
	 */
	public static MainAdminMenuRO getNowMenuParent(final String url){
		MainAdminMenuRO result = null;
		
		if(isLogin()){
			List<MainAdminMenuRO> authMenus = getAdminMenu();
			if(authMenus == null){
				return null;
			}
			
			for(MainAdminMenuRO adminMenus : authMenus){
				for(MainAdminMenuRO adminMenu : adminMenus.getChilds()){
					if(url.startsWith(adminMenu.getMenuUrl())){
						if(adminMenu.getWriteFlag().equals("Y")){
							result = adminMenus;
							break;
						}
					}
				}
			}
		}
		return result;
	}
	
	
}
