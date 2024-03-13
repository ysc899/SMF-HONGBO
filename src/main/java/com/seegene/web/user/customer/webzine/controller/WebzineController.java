package com.seegene.web.user.customer.webzine.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;
import com.seegene.web.user.customer.webzine.service.WebzineService;
import com.seegene.web.user.customer.webzine.vo.WebzineListRO;
import com.seegene.web.user.customer.webzine.vo.WebzineSearchPO;

@RequestMapping("/customer/webzine")
@Controller
public class WebzineController {
	
	@Autowired
	private WebzineService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request) throws Exception{
		
		model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));
		
		if(locale.getLanguage().equals("ko")){
		
		return "/user/customer/webzine/index";
		}else{
			return "/user/customer/webzine/en/index";
			
		}
	}

	
	@RequestMapping(value="/moreInfo.json", method=RequestMethod.GET)
	public String moreInfo(final WebzineSearchPO param, final Locale locale, final Model model, final HttpServletRequest req){
		
		
		System.out.println("param ::::::::::::::::" + param.getCodeEbookCatType());
		
		CommonListReuslt<WebzineListRO> result = service.findWebzineInfoMoreList(param, locale);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	
}
