package com.seegene.web.auth.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.seegene.web.admin.user.vo.AdminUserVO;
import com.seegene.web.admin.user.vo.MainAdminMenuRO;

import lombok.Getter;


/**
 * 로그인용 사용자 정보
 */
public class AuthUser implements UserDetails{

	private static final long serialVersionUID = 1475521454411214821L;
	
	private String username;

	private String password;
	
	@Getter
	private String id;
	
	@Getter
	private String name;

	@Getter
	private String email;
	
	/** 병원 코드 */
	@Getter
	private String hospitalCode;
	
	/** 비밀번호 초기화 여부 */
	@Getter
	private String passwordFlag;
	
	@Getter
	private String trmsUrl;
	
//	private String adminMenuJson;
	
	@Getter
	private List<MainAdminMenuRO> adminMenus;
	
	
	private Collection<? extends GrantedAuthority> authoritise;
	
	
	public AuthUser() {
	}

	public AuthUser(String username, String password) {
		super();
		this.username = username;
		this.password = password;
		
		//TODO 로그인한 사용자 종류에 따라 권한 설정 주기
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		
	}
	/** 일반 사용자 로그인용 */
	public AuthUser(DB2UserLoginVO userInfo) {
		super();
		this.username = userInfo.getI_UID();
		this.password = userInfo.getI_PWD_NXT();
		this.name = userInfo.getO_PUNM();
		this.hospitalCode = userInfo.getO_PHCD();
		this.passwordFlag = userInfo.getO_PIYN();
		this.trmsUrl = userInfo.getTrmsUrl();
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		
	}
	

	public AuthUser(String username, String password, String email) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		//TODO 로그인한 사용자 종류에 따라 권한 설정 주기
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		if (StringUtils.isNotEmpty(username) && username.equals("admin")) {
			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
	}
	
//	/**
//	 * 
//	 * @param username userid
//	 * @param password pw
//	 * @param email 세션에 올라갈 정보 email
//	 * @param adminMenus 세션에 올라갈 관리자 메뉴 정보
//	 */
//	public AuthUser(String username, String password, String email, List<MainAdminMenuRO> adminMenus) {
//		super();
//		this.username = username;
//		this.password = password;
//		this.email = email;
//		this.adminMenus = adminMenus;
//		
//		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
//		authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//		this.authoritise = authorities;
//	}
	
	/**
	 * 
	 * @param adminUser 관리자 vo
	 * @param adminMenus 해당 사용자가 접근 가능한 메뉴
	 */
	public AuthUser(final AdminUserVO adminUser, final List<MainAdminMenuRO> adminMenus){
		super();
		this.username = adminUser.getUserId();
		this.password = adminUser.getPassword();
		this.email = adminUser.getEmail();
		this.id = adminUser.getUserId();
		this.name = adminUser.getName();
		this.adminMenus = adminMenus;
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		
		this.authoritise = authorities;
		
	}
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authoritise;
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	
}
