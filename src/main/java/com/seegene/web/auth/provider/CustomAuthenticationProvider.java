package com.seegene.web.auth.provider;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.seegene.web.auth.service.CustomUserDetailsService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	
//	@Autowired
//	private BCryptPasswordEncoder encoder;
//	private ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
	
	@Autowired
	private ShaPasswordEncoder encoder;
	

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication;
		
		
		UserDetails userInfo = customUserDetailsService.loadUserByUsername(authToken.getName());
		
		
		if(userInfo == null){
			throw new UsernameNotFoundException(authToken.getName());
		}
		
		
		if(!userInfo.getPassword().equals(encoder.encodePassword(authToken.getCredentials().toString(), null))){
			throw new BadCredentialsException("not matching username or password");
		}
		
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) userInfo.getAuthorities();
		//사용자 종류에 따른 권한 설정
		
		return new UsernamePasswordAuthenticationToken(userInfo, null, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
