package com.seegene.web.user.foundation.vision.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/foundation/vision")
public class VisionController {

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
		if(locale.getLanguage().equals("ko")){
		return "/user/foundation/vision/index";
		}else{
			return "/user/foundation/vision/en/index";
		}
	}	
	
}
