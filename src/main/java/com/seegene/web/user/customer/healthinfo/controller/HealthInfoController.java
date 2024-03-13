package com.seegene.web.user.customer.healthinfo.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.user.customer.healthinfo.service.HealthInfoService;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserListRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserViewRO;
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;

@Controller
@RequestMapping("/customer/healthinfo")
public class HealthInfoController {
	
	@Autowired
	private HealthInfoService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final UserSearchPaggingCommonPO param, final Model model, final HttpServletRequest request) throws Exception{
		
		if(locale.getLanguage().equals("ko")){
			CommonListReuslt<HealthInfoUserListRO> result = service.findHealthInfoList(param, locale);
			model.addAttribute("result", result);
			model.addAttribute("allTitle", service.findAllInfoTitle(locale.getLanguage()));
			
			return "/user/customer/healthinfo/index";
		}else{
			CommonListReuslt<HealthInfoUserListRO> result = service.findHealthInfoList(param, locale);
			model.addAttribute("result", result);
			model.addAttribute("allTitle", service.findAllInfoTitle(locale.getLanguage()));
			
			return "/user/customer/healthinfo/en/index";
		}		
	}
	

	/**
	 * @param seq 검사코드 seq
	 * @param type 수기입력 여부
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/moreInfo.json", method=RequestMethod.GET)
	public String testInfo(final UserSearchPaggingCommonPO param, final Locale locale, final Model model, final HttpServletRequest req){
		
		
		List<HealthInfoUserListRO> result = service.findHealthInfoMoreList(param, locale.getLanguage());
		model.addAttribute("result", result);
		
		
		return "jsonView";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request) throws NumberFormatException, IOException{
		
		
		HealthInfoUserViewRO result = service.findHealthInfoView(seq, locale.getLanguage(), request);
		model.addAttribute("result", result);
		model.addAttribute("param", param);
		
		if(locale.getLanguage().equals("ko")){
			return "/user/customer/healthinfo/view";	
		}else{
			return "/user/customer/healthinfo/en/view";
		}
		
		
	}
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/thum/{seq}.view", method=RequestMethod.GET)
	public void thumView(@PathVariable("seq") final int seq, final Locale locale,  final HttpServletRequest request, final HttpServletResponse response) throws NumberFormatException, IOException{
		
		service.findHealthThumView(seq, locale.getLanguage(), request, response);
		
	}
}
