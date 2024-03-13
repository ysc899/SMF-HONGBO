package com.seegene.web.user.inspection.staffs.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.user.inspection.staffs.service.StaffsUserService;
import com.seegene.web.user.inspection.staffs.vo.StaffsUserViewRO;

@Controller
@RequestMapping("/inspection/staffs")
public class StaffsUserController {
	
	@Autowired
	private StaffsUserService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final Locale locale,  final Model model, final HttpServletRequest request) throws Exception{
		
		model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));
		model.addAttribute("result",service.getStaffsList(locale.getLanguage()));
		model.addAttribute("lang", locale.getLanguage());
		
		if(locale.getLanguage().equals("ko")){
			return "/user/inspection/staffs/index";
		}else{
			return "/user/inspection/staffs/en/index";
		}
	}
	
	@RequestMapping(value="/{seq}/view.json", method=RequestMethod.GET)
	public String viewInfo(@PathVariable("seq") final int seq, final Locale locale, final Model model){
		
		StaffsUserViewRO result = service.findStaffsViewInfo(seq, locale);
		model.addAttribute("result", result);
		
		return "jsonView";
	}

}
