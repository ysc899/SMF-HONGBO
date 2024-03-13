package com.seegene.web.auth.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.seegene.web.admin.user.vo.MainAdminMenuRO;
import com.seegene.web.common.SessionUtil;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{


	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		
		RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
		
		
		if(SessionUtil.getUserRoleType() == SessionUtil.ADMIN){
			
			List<MainAdminMenuRO> adminMenu = SessionUtil.getAdminMenu();
			
			String url = adminMenu.get(0).getChilds().get(0).getMenuUrl();
			
			if(!url.endsWith(".do")){
				url += "index.do";
			}
			
			redirectStratgy.sendRedirect(req, res, url);
			
		}else{
			redirectStratgy.sendRedirect(req, res, "/index.do");
		}
		
		
	}

	
	
}
