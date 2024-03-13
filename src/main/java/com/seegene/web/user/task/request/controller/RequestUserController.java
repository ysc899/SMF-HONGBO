package com.seegene.web.user.task.request.controller;

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

import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.user.task.request.service.RequestUserService;

@Controller
@RequestMapping("/task/request")
public class RequestUserController {
	
	@Autowired
	private RequestUserService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final UserSearchPaggingCommonPO param, final Model model, final HttpServletRequest request) throws Exception{
		
		if(locale.getLanguage().equals("ko")){
			model.addAttribute("param", param);
			model.addAttribute("result", service.findRequestList(locale.getLanguage(), param));
			return "/user/task/request/index";
		}else{
			model.addAttribute("param", param);
			model.addAttribute("result", service.findRequestList(locale.getLanguage(), param));
			return "/user/task/request/en/index";
		}		
	}
	
	/**
	 * @param seq 의뢰서 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/download/{seq}.do", method=RequestMethod.GET)
	public void downloadFile(@PathVariable("seq") final int seq, final HttpServletRequest request,final  HttpServletResponse response){
		
		service.downloadRequestFile(seq, request, response);
	}
	/**
	 * @param seq 의뢰서 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/thum/{seq}.do", method=RequestMethod.GET)
	public void thumFile(@PathVariable("seq") final int seq, final HttpServletRequest request,final  HttpServletResponse response){
		
		service.thumRequestFile(seq, request, response);
	}
	
	/**
	 * @param seq 의뢰서 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/view/{seq}.do", method=RequestMethod.GET)
	public void viewFile(@PathVariable("seq") final int seq, final HttpServletRequest request,final  HttpServletResponse response){
		
		service.viewRequestFile(seq, request, response);
	}
	
	/**
	 * @param seq 의뢰서 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 * @throws IOException 
	 */
	@RequestMapping(value="/base64/{seq}.do", method=RequestMethod.GET)
	public String base64File(@PathVariable("seq") final int seq, Model model, final HttpServletRequest request,final  HttpServletResponse response) throws IOException{
		
		model.addAttribute("result", service.base64RequestFile(seq, request, response));
		
		return "jsonView";
	}
	
}
