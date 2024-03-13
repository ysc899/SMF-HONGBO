package com.seegene.web.user.inspection.origin.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/inspection/origin")
public class OriginController {
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index(final Locale locale,  final Model model, final HttpServletRequest request) throws Exception{
		
		if(locale.getLanguage().equals("ko")){
			return "/user/inspection/origin/index";
		}else{
			return "/user/inspection/origin/en/index";
		}
	}
}
