package com.seegene.web.user.faq.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.user.faq.service.FaqService;
import com.seegene.web.user.faq.vo.FaqUserListViewRO;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/{masterSeq}/index.do", method=RequestMethod.GET)
	public String view(@PathVariable("masterSeq") final int masterSeq, final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
		
		FaqUserListViewRO result = service.findFaqList(masterSeq, locale);
		model.addAttribute("result", result);
		
		return "/user/faq/index";
	}
	
	@RequestMapping(value="/special/index.do", method=RequestMethod.GET)
	public String specialFaq(final Locale locale, final Model model, final HttpServletRequest request){
		
		model.addAttribute("result", service.findFaqList(1, locale));
		model.addAttribute("specialResult", service.findFaqList(2, locale));
		
		return "/user/faq/special/index";
	}
	
}
