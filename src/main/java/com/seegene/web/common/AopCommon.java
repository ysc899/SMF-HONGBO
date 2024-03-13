package com.seegene.web.common;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.seegene.web.admin.log.access.service.LogAccessService;
import com.seegene.web.user.logo.service.LogoService;
import com.seegene.web.user.menu.service.UserMenuService;

@Component
@Aspect
public class AopCommon {
	
	@Autowired
	private UserMenuService userMenuService;
	
	@Autowired
	private LogoService logoService;
	
	@Autowired
	private LogAccessService logAccessService;
	
	
	@Around("execution(* com.seegene.web.user..controller.*Controller.*(..)) or execution(* com.seegene.web.main.controller.*Controller.*(..))" )
	public Object setMenu(ProceedingJoinPoint jp) throws Throwable{
		
		String locCode = "ko";
		Model m = null;
		
		Object[] obj = jp.getArgs();
		
		for(Object o : obj){
			
			if(o.getClass().getSimpleName().equals("Locale")){
				Locale locale = (Locale)o;
				locCode = locale.getLanguage();
			}else if(o.getClass().getSimpleName().equals("BindingAwareModelMap")){
				m = (Model)o;
			}
		}
		if(m != null ){
			//메뉴들 입력 처리
			m.addAttribute("menus", userMenuService.getMenus(locCode));
			m.addAttribute("logos", logoService.getLogos(locCode));
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			String requestURI = request.getRequestURI();
			m.addAttribute("fullUrl", requestURI);
			m.addAttribute("urlDesc", userMenuService.getUrl2Name(locCode, requestURI));
			logAccessService.writeLog(request, locCode);

		}
		Object proceed = jp.proceed();
		
		return proceed;
	}

}
