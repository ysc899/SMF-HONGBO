package com.seegene.web.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.user.service.AdminUserService;
import com.seegene.web.admin.user.vo.AdminUserVO;
import com.seegene.web.admin.user.vo.MainAdminMenuRO;
import com.seegene.web.auth.vo.AuthUser;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private AdminUserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		AdminUserVO user = userService.findUserId(username);
		
		if(user == null){
			
			return null;
		}
		
		List<MainAdminMenuRO> adminMenus = userService.findMainAdminMenu(username);
		
		//세션 정보 생성
		UserDetails userDetails = new AuthUser(user, adminMenus);
		
		//최종 로그인 시간 업데이트
		userService.updateLastLogin(username);
		
		return userDetails;
	}

	
	
}
