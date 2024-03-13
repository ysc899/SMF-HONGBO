package com.seegene.web.user.promotion.controller;

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
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;
import com.seegene.web.user.promotion.service.PromotionUserService;
import com.seegene.web.user.promotion.vo.PromotionSearchPO;
import com.seegene.web.user.promotion.vo.PromotionUserListRO;

@RequestMapping("/promotion")
@Controller
public class PromotionUserController {
	
	@Autowired
	private PromotionUserService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request) throws Exception{
		
//		model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));
		
//		return "/user/promotion/index";

		if(locale.getLanguage().equals("ko")){
			return "/user/promotion/index";
		}else{
			return "/user/promotion/en/index";
		}
	}


	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/video/index.do", method=RequestMethod.GET)
	public String viewEnVideo(final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request) throws Exception{

		model.addAttribute("ptype", "video");

//		return "/user/promotion/index";

		if(locale.getLanguage().equals("ko")){
			return "/user/promotion/index";
		}else{
			return "/user/promotion/en/index";
		}
	}
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/book/index.do", method=RequestMethod.GET)
	public String viewEnBook(final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request) throws Exception{

		model.addAttribute("ptype", "book");

//		return "/user/promotion/index";

		if(locale.getLanguage().equals("ko")){
			return "/user/promotion/index";
		}else{
			return "/user/promotion/en/index";
		}
	}
	
//	
	@RequestMapping(value="/moreInfo.json", method=RequestMethod.GET)
	public String moreInfo(final PromotionSearchPO param, final Locale locale, final Model model, final HttpServletRequest req){
		
		CommonListReuslt<PromotionUserListRO> result = service.findPromotionMoreList(param, locale);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	/**
	 * @param seq 식별자
	 * @param req req
	 * @param res res
	 */
	@RequestMapping(value="/stream/{seq}.view", method=RequestMethod.GET)
	public void streamPromotion(@PathVariable("seq") final int seq, final HttpServletRequest req, final HttpServletResponse res){
		service.streamPromotion(seq, req, res);
	}
	
}
