package com.seegene.web.user.inspection.cert.controller;

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
import com.seegene.web.user.inspection.cert.service.CertService;
import com.seegene.web.user.inspection.cert.vo.CertListRO;
import com.seegene.web.user.inspection.cert.vo.CertSearchPO;

@RequestMapping("/inspection/cert")
@Controller
public class CertController {
	
	@Autowired
	private CertService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale,  final Model model, final HttpServletRequest request) throws Exception{
		
		model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));
		if (locale.getLanguage().equals("ko")) {
			return "/user/inspection/cert/index";
		}else{
			return "/user/inspection/cert/en/index";
		}
	}

	
	@RequestMapping(value="/moreInfo.json", method=RequestMethod.GET)
	public String moreInfo(final CertSearchPO param, final Locale locale, final Model model, final HttpServletRequest req){
		
		CommonListReuslt<CertListRO> result = service.findCertInfoMoreList(param, locale);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param fileSeq 파일 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/download/{seq}.do", method=RequestMethod.GET)
	public void downloadFile(@PathVariable("seq") final int seq,  final HttpServletRequest request,final  HttpServletResponse response){
		
		service.downloadCert(seq, request, response);
	}
	
	/**
	 * @param seq 공문 seq
	 * @param fileSeq 파일 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 * @throws IOException 
	 */
	@RequestMapping(value="/stream/{seq}.json", method=RequestMethod.GET)
	public String streamFile(@PathVariable("seq") final int seq, final Model model, final HttpServletRequest request) throws IOException{
		
		model.addAttribute("result", service.streamCert(seq));
		
		return "jsonView";
	}
	
	
}
