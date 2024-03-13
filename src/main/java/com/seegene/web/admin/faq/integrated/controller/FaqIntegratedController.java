package com.seegene.web.admin.faq.integrated.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.faq.integrated.service.FaqIntegratedService;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedAddPO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedEditPO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedResultRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;

@Controller
@RequestMapping("/admin/faq/integrated")
public class FaqIntegratedController {

	@Autowired
	private FaqIntegratedService service;
	
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/{masterSeq}/index.do", method=RequestMethod.GET)
	public String list(@PathVariable("masterSeq") final int masterSeq, final SearchIntegrateSearchPaggingPO param, final Model model) throws Exception{
		
		CommonListReuslt<FaqIntegratedResultRO> result = service.findFaqIntegratedList(masterSeq, param);
		
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		return "/admin/faq/integrated/list";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{masterSeq}/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("masterSeq") final int masterSeq, @PathVariable("seq") final int seq, final SearchIntegrateSearchPaggingPO param, final Model model) throws NumberFormatException, IOException{
		
		FaqIntegratedResultRO result = service.findFaqIntegratedView(masterSeq, seq);
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		model.addAttribute("sparam", param);

		return "/admin/faq/integrated/view";
	}
	
	/**
	 * @param masterSeq 부모 seq
	 * @param model 모델
	 * @return faq 내용 등록 페이지
	 */
	@RequestMapping(value="/{masterSeq}/add.write", method = RequestMethod.GET)
	public String addForm(@PathVariable("masterSeq") final int masterSeq,final SearchIntegrateSearchPaggingPO param, final Model model){
		
		model.addAttribute("defaultInfo", service.getAddFaqIntegratedDefaultInfo());
		model.addAttribute("masterSeq", masterSeq);
		model.addAttribute("sparam", param);

		return "/admin/faq/integrated/add";
	}
	
	/**
	 * @param masterSeq 부모 seq
	 * @param param faq 내용 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/{masterSeq}/addFaqIntegrated.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addFaqIntegrated(@PathVariable("masterSeq") final int masterSeq, @RequestBody final FaqIntegratedAddPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.addFaqIntegrated(masterSeq, param, req));

		return "jsonView";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{masterSeq}/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("masterSeq") final int masterSeq, @PathVariable("seq") final int seq,final SearchIntegrateSearchPaggingPO param, final Model model) throws NumberFormatException, IOException{
		
		FaqIntegratedResultRO result = service.findFaqIntegratedView(masterSeq, seq);
		model.addAttribute("result", result);
		model.addAttribute("defaultInfo", service.getAddFaqIntegratedDefaultInfo());
		model.addAttribute("masterSeq", masterSeq);
		model.addAttribute("sparam", param);

		return "/admin/faq/integrated/edit";
	}
	
	/**
	 * @param param 관리자 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/{masterSeq}/editFaqIntegrated.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editFaqManage(@PathVariable("masterSeq") final int masterSeq, @RequestBody final FaqIntegratedEditPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.editFaqIntegrated(masterSeq, param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param masterSeq 마스터 FAQseq
	 * @param seq 내용 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{masterSeq}/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("masterSeq") final int masterSeq,@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteFaqIntegrated(masterSeq, seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
