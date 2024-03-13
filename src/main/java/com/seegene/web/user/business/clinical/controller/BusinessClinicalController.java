package com.seegene.web.user.business.clinical.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.user.business.clinical.service.BusinessClinicalService;
import com.seegene.web.user.business.clinical.vo.BusinessClinicalNetworkListRO;
import com.seegene.web.user.business.clinical.vo.NetworkSearchPO;

@Controller
@RequestMapping("/business/clinical")
public class BusinessClinicalController {

	@Autowired
	private BusinessClinicalService service;

	/**
	 * @param param
	 *            검색조건
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String list(final Locale locale, final Model model, final HttpServletRequest request) throws Exception {

		if (locale.getLanguage().equals("ko")) {
			model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));

			return "/user/business/clinical/index";
		} else {
			return "/user/business/clinical/en/index";
		}
	}

	@RequestMapping(value = "/network.json", method = RequestMethod.GET)
	public String viewInfo(final NetworkSearchPO param, final Locale locale, final Model model) {

		List<BusinessClinicalNetworkListRO> result = service.findNetworkInfo(param, locale);
		model.addAttribute("result", result);

		return "jsonView";
	}

}
