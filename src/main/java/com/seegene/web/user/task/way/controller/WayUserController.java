package com.seegene.web.user.task.way.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/task/way")
public class WayUserController {

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
		if (locale.getLanguage().equals("ko")) {
			return "/user/task/way/index";
		} else {
			return "/user/task/way/en/index";
		}
	}	
	
}