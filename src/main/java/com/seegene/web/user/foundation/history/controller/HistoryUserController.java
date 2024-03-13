package com.seegene.web.user.foundation.history.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.user.foundation.history.service.HistoryUserService;
import com.seegene.web.user.foundation.history.vo.HistorySearchPO;
import com.seegene.web.user.foundation.history.vo.HistoryUserResultRO;

@Controller
@RequestMapping("/foundation/history")
public class HistoryUserController {

	@Autowired
	private HistoryUserService service;

	/**
	 * @param param
	 *            검색조건
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String view(final Locale locale, final Model model, final HttpServletRequest request) throws Exception {

		model.addAttribute("defaultInfo", service.getDefaultInfo(locale));
		if (locale.getLanguage().equals("ko")) {
			return "/user/foundation/history/index";
		} else {
			return "/user/foundation/history/en/index";
		}
	}

	@RequestMapping(value = "/getData.json", method = RequestMethod.GET)
	public String moreInfo(final HistorySearchPO param, final Locale locale, final Model model,
			final HttpServletRequest req) {

		HistoryUserResultRO result = service.getData(locale, param);
		model.addAttribute("result", result);

		return "jsonView";
	}
}
