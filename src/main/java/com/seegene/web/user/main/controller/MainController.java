package com.seegene.web.user.main.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seegene.web.auth.vo.UserChangePwPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.user.main.service.MainService;
import com.seegene.web.user.main.vo.DevicePO;
import com.seegene.web.user.main.vo.MainResultRO;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/index.do")
	public String main(Locale locale, HttpServletRequest request, Model model, HttpSession session){
		MainResultRO result = service.getMainInfo(locale);

		
		model.addAttribute("loginYn", SessionUtil.isLogin());
	    model.addAttribute("roleType", session.getAttribute("roleType"));
	    
		if(SessionUtil.isLogin() == true){
			model.addAttribute("userId", SessionUtil.getAuthUserId() );	
		}
		
		
		model.addAttribute("result", result);
		model.addAttribute("lang", locale.getLanguage());
		
		if(locale.getLanguage().equals("ko")){
			return "/user/index";
		}else{
			return "/user/index_en";
		}
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(){
		return "/user/logout";
	}
	
	@RequestMapping(value="/main/banner/{seq}.do", method=RequestMethod.GET)
	public void mainBannerImage(@PathVariable("seq") final int seq, final Locale locale, final HttpServletRequest request, final HttpServletResponse response) throws NumberFormatException, IOException{
		service.getMainBannerImage(seq, locale, request, response);
	}
	
	
	@RequestMapping("/policy/index.do")
	public String policyIndex(Locale locale, Model model){
		return "/user/policy/index";
	}
	
	@RequestMapping("/search/index.do")
	public String totalSearch(@RequestParam("searchKeyword") final String searchKeyword, final  Locale locale, final HttpServletRequest request, final Model model){
		
		model.addAttribute("result", service.allSearch(searchKeyword, locale, request));
		return "/user/search/index";
	}
	
	@RequestMapping("/reload/server.do")
	public void reload() throws Exception{
		
		service.reload();
	}
	
	@RequestMapping(value="/device.json", method=RequestMethod.GET)
	public String deviceInfo(final DevicePO param, final HttpServletRequest request, final Model model){
		
		service.deviceLog(param, request);
		model.addAttribute("result", 1);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/goTrms.json", method=RequestMethod.GET)
	public String goTrms(final HttpServletRequest request, final Model model){
		
		model.addAttribute("result", service.getTrms(request));
		
		return "jsonView";
	}

}
