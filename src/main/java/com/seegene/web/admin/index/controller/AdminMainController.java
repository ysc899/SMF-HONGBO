package com.seegene.web.admin.index.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seegene.web.admin.user.vo.MainAdminMenuRO;
import com.seegene.web.common.SessionUtil;

@RequestMapping("/admin")
@Controller
public class AdminMainController {
	
	
	@RequestMapping("/login.do")
	public String login(){
		
		if(SessionUtil.isLogin()){
			if(SessionUtil.getUserRoleType() == SessionUtil.ADMIN){
				
				List<MainAdminMenuRO> adminMenu = SessionUtil.getAdminMenu();
				
				String url = adminMenu.get(0).getChilds().get(0).getMenuUrl();
				
				if(!url.endsWith(".do")){
					url += "index.do";
				}
				
				return "redirect:"+ url;
				
			}else{
				return "redirect:/?checkRole=user";
			}
			
		}
		
		return "/admin/index/AdminLogin";
	}
	
	@RequestMapping("/index.do")
	public String main(){
		
		return "/admin/index";
	}
	

}
