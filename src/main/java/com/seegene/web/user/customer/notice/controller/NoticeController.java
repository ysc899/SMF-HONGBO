package com.seegene.web.user.customer.notice.controller;

import java.io.IOException;
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
import com.seegene.web.common.SessionUtil;
import com.seegene.web.user.customer.notice.service.NoticeService;
import com.seegene.web.user.customer.notice.vo.NoticeListRO;
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;
import com.seegene.web.user.customer.notice.vo.NoticeViewRO;

@Controller
@RequestMapping("/customer/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request) throws Exception{
		
		
		System.out.println(" L O G I N Y N :::::::::::::::::::::::"+SessionUtil.isLogin());
		
		param.setLoginYn(SessionUtil.isLogin());
		
		CommonListReuslt<NoticeListRO> result = service.findNoticeList(param, locale);
		
		model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));
		model.addAttribute("result", result);
		model.addAttribute("notice", service.getNoticeList(locale));
		model.addAttribute("loginYn", SessionUtil.isLogin());
		
		if(locale.getLanguage().equals("ko")){
			return "/user/customer/notice/index";
		}else{
			return "/user/customer/notice/en/index";
		}
		
	
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
		
		
		NoticeViewRO notice = service.findNoticeInfo(seq, locale.getLanguage());
		model.addAttribute("result", notice);
		model.addAttribute("param", param);
		
		if(locale.getLanguage().equals("ko")){
			return "/user/customer/notice/view";
		}else{
			return "/user/customer/notice/en/view";
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
	public void thumImage(@PathVariable("seq") final int seq, final Locale locale, final NoticeSearchPO param, final Model model, final HttpServletRequest request, final HttpServletResponse response){
		
		service.findNoticeThum(seq, locale.getLanguage(), request, response);
		
	}
	
	/**
	 * @param seq 공문 seq
	 * @param fileSeq 파일 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/download/{seq}/{fileSeq}.do", method=RequestMethod.GET)
	public void downloadFile(@PathVariable("seq") final int seq, @PathVariable("fileSeq") final int fileSeq, final HttpServletRequest request,final  HttpServletResponse response){
		
		service.downloadNoticeFile(seq, fileSeq, request, response);
	}
	
	
	
}
