package com.seegene.web.user.customer.insp.controller;

import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;
import com.seegene.web.user.promotion.service.PromotionUserService;
import com.seegene.web.user.promotion.vo.PromotionSearchPO;
import com.seegene.web.user.promotion.vo.PromotionUserListRO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@RequestMapping("/customer/webzine")
@Controller
public class InspVideoController {
	


	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insp_index.do", method=RequestMethod.GET)
	public String inspEnVideo(final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request) throws Exception{

		model.addAttribute("ptype", "insp");


		if(locale.getLanguage().equals("ko")){
			return "/user/customer/insp/index";
		}else{
			return "/user/customer/insp/en/index";
		}
	}

}
