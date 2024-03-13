package com.seegene.web.user.foundation.map.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.user.foundation.map.service.MapService;

@Controller
@RequestMapping("/foundation/map")
public class MapController {

	@Autowired
	private MapService service;
	
	/**
	 * @param param
	 *            검색조건
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String view(final Locale locale, final Model model, final HttpServletRequest request) throws Exception {

		if (locale.getLanguage().equals("ko")) {
			
			model.addAttribute("apiKey", service.getApiKey());
			return "/user/foundation/map/index";
		} else {
			return "/user/foundation/map/en/index";
		}
	}

}
