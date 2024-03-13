package com.seegene.web.auth.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;

import com.seegene.web.common.SessionUtil;

public class AdminAuthFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String url = req.getRequestURI();
		
		
		if(url.startsWith("/admin/util")){
			//관리자 유틸
			if(SessionUtil.getUserRoleType() == SessionUtil.ADMIN){
				filterChain.doFilter(req, res);
			}
			
		}
		
		if(url.equals("/admin/login.do") || !url.startsWith("/admin") ){
			filterChain.doFilter(req, res);
			return;
		}
		
		
		boolean authCheckFlag = SessionUtil.checkAdminUserAuth(url);
		if(authCheckFlag){
			try{
				filterChain.doFilter(req, res);
			}catch(Exception e){
				e.printStackTrace();
				res.setStatus(404);
			}
		}else{
			res.setStatus(403);
			
			throw new AccessDeniedException("");
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

	
	
}
