package com.seegene.web.user.customer.statute.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.common.SessionUtil;

@Controller
@RequestMapping("/customer/statute")
public class StatuteController {

	/**
	 * @param param
	 *            검색조건
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String view(final Locale locale, final Model model, final HttpServletRequest request) throws Exception {
		
			if(SessionUtil.isLogin()){
		
				return "/user/customer/statute/index";
			}else{
				return "redirect:/";
			}
	}
}
