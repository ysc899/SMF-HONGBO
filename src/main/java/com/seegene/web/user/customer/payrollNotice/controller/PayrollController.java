package com.seegene.web.user.customer.payrollNotice.controller;

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
import com.seegene.web.user.customer.payrollNotice.service.PayrollService;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollListRO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollSearchPO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollViewRO;

@Controller
@RequestMapping("/customer/payrollNotice")
public class PayrollController {
	
	@Autowired
	private PayrollService service;

	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String view(final Locale locale, final PayrollSearchPO param, final Model model, final HttpServletRequest request) throws Exception{
		
		CommonListReuslt<PayrollListRO> result = service.findPayrollNoticeList(param, locale);
		
		model.addAttribute("defaultInfo", service.getDefaultData(locale.getLanguage()));
		model.addAttribute("result", result);
		model.addAttribute("notice", service.getPayrollNoticeList(locale));
		
		return "/user/customer/payrollNotice/index";
	}	
	
	/**
	 * @param seq 급여 고시  seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final Locale locale, final PayrollSearchPO param, final Model model, final HttpServletRequest request) throws NumberFormatException, IOException{
		
		
		PayrollViewRO notice = service.findPayrollNoticeInfo(seq, locale.getLanguage());
		model.addAttribute("result", notice);
		model.addAttribute("param", param);
		
		return "/user/customer/payrollNotice/view";
	}
	
	/**
	 * @param seq 급여 고시  seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/thum/{seq}.view", method=RequestMethod.GET)
	public void thumImage(@PathVariable("seq") final int seq, final Locale locale, final PayrollSearchPO param, final Model model, final HttpServletRequest request, final HttpServletResponse response){
		
		service.findNoticeThum(seq, locale.getLanguage(), request, response);
		
	}
	
	/**
	 * @param seq 급여 고시  seq
	 * @param fileSeq 파일 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/download/{seq}/{fileSeq}.do", method=RequestMethod.GET)
	public void downloadFile(@PathVariable("seq") final int seq, @PathVariable("fileSeq") final int fileSeq, final HttpServletRequest request,final  HttpServletResponse response){
		
		service.downloadPayrollNoticeFile(seq, fileSeq, request, response);
	}
	
	
	
}
