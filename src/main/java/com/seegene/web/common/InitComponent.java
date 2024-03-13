package com.seegene.web.common;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.logo.service.LogoService;
import com.seegene.web.user.main.service.MainService;
import com.seegene.web.user.menu.service.UserMenuService;

@Component
public class InitComponent {
	
//	/** 관리자 메뉴 서비스 */
//	@Autowired
//	private MenuAdminService menuAdminService;
//	@Autowired
//	private AdminUserService adminUserService;
	
//	@Autowired
//	private AdminUtilService adminUtilService;
	
	
	@Autowired
	private UserMenuService userMenuService;
	@Autowired
	private UserCodeService userCodeService;
	
	@Autowired
	private LogoService logoService;
	
	@Autowired
	private MainService userMainService;
	
	
	/**
	 * 시스템 구동 시 매일 0시 1분 0초에 실행 
	 * 메모리에 올릴 메소드들 실행
	 */
	@PostConstruct
	@Scheduled(cron = "0 1 0 * * *")
	public void init(){
		
//		adminUtilService.init();
		
//		adminUserService.findMainAdminMenu("system");
		
//		menuAdminService.getMenuAdmin();
		
		userMenuService.initMenus();
		
		userCodeService.initCodes();
		
		userMainService.initMain();
		
		logoService.initLogos();
	}
	
	
	

}
