package com.seegene.web.user.task.vessel.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.user.task.vessel.service.VesselUserService;
import com.seegene.web.user.task.vessel.vo.VesselUserAllListRO;
import com.seegene.web.user.task.vessel.vo.VesselUserListRO;
import com.seegene.web.user.task.vessel.vo.VesselUserViewRO;

@Controller
@RequestMapping("/task/vessel")
public class VesselUserController {
	
	@Autowired
	private VesselUserService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
		
		if(locale.getLanguage().equals("ko")){
			List<VesselUserAllListRO> allList = service.findAllList(locale);
			model.addAttribute("allList", allList);
			return "/user/task/vessel/index";
		}else{
			List<VesselUserAllListRO> allList = service.findAllList(locale);
			model.addAttribute("allList", allList);
			return "/user/task/vessel/en/index";
		}
	}	
	
	@RequestMapping(value="/moreInfo.json", method=RequestMethod.GET)
	public String moreInfo(final UserSearchPaggingCommonPO param, final Locale locale, final Model model, final HttpServletRequest req){
		
		CommonListReuslt<VesselUserListRO> result = service.findVesselMoreList(param, locale);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/{seq}/viewInfo.json", method=RequestMethod.GET)
	public String viewInfo(@PathVariable("seq") final int seq, final Locale locale, final Model model, final HttpServletRequest req){
		
		VesselUserViewRO result = service.findVesselViewInfo(seq, locale);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
