package com.seegene.web.user.board.recruit.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.user.board.recruit.service.RecruitService;
import com.seegene.web.user.board.recruit.vo.RecruitListRO;
import com.seegene.web.user.board.recruit.vo.RecruitSearchPO;
import com.seegene.web.user.board.recruit.vo.RecruitViewRO;

@RequestMapping("/board/recruit")
@Controller
public class RecruitController {
	
	@Autowired
	private RecruitService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final RecruitSearchPO param, final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
		
		model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));
		
		CommonListReuslt<RecruitListRO>  result = service.findRecruitList(param, locale);
		model.addAttribute("result", result);
		
		return "/user/board/recruit/index";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final Locale locale, final RecruitSearchPO param, final Model model, final HttpServletRequest request) throws NumberFormatException, IOException{
		
		
		RecruitViewRO result = service.findRecruiInfo(seq, locale.getLanguage());
		model.addAttribute("result", result);
		model.addAttribute("param", param);
		
		return "/user/board/recruit/view";
	}
}
