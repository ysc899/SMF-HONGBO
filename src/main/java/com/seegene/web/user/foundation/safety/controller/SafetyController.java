package com.seegene.web.user.foundation.safety.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
@RequestMapping("/foundation/safety")
public class SafetyController {

	/**

	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
//		if(locale.getLanguage().equals("ko")){
		return "/user/foundation/safety/index";
//		}else{
//			return "/user/foundation/safety/en/index";
//		}
	}	
	
}
