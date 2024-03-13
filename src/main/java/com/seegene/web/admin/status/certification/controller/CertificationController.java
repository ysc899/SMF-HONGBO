package com.seegene.web.admin.status.certification.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.status.certification.service.CertificationService;
import com.seegene.web.admin.status.certification.vo.CertificationAddPO;
import com.seegene.web.admin.status.certification.vo.CertificationEditPO;
import com.seegene.web.admin.status.certification.vo.CertificationListRO;
import com.seegene.web.admin.status.certification.vo.CertificationViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/status/certification")
public class CertificationController {
	
	@Autowired
	private CertificationService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<CertificationListRO> result = service.findCertificationList(param);
		model.addAttribute("result", result);
		
		return "/admin/status/certification/list";
	}
	

	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model) throws IOException{
		
		CertificationViewRO cert = service.findCertificationInfo(seq);
		
		model.addAttribute("result", cert);
		model.addAttribute("sparam", param);

		return "/admin/status/certification/view";
	}
	
	/**
	 * @param model 모델
	 * @return 인증현황 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddCertificationDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/status/certification/add";
	}
	
	
	/**
	 * @param model 모델
	 * @return 인증현황 출력 순서
	 */
	@RequestMapping(value="/maxPrintOrder.json", method = RequestMethod.GET)
	public String checkDate(@RequestParam("lang") final String lang, 
			@RequestParam("centerCode") final String centerCode,
			@RequestParam("certCode") final String certCode,
			@RequestParam("certLocCode") final String certLocCode,
			final Model model){
		
		model.addAttribute("result", service.maxPrintOrder(lang, centerCode, certCode, certLocCode));
		
		return "jsonView";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/addCertification.write", method = RequestMethod.POST)
	public String addCertification(final CertificationAddPO param, @RequestParam("certFile") final MultipartFile certFile, @RequestParam("thumFile") final MultipartFile[] thumFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.addCertification(param, certFile, thumFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		CertificationViewRO cert = service.findCertificationInfo(seq);
		
		model.addAttribute("result", cert);
		model.addAttribute("defaultInfo", service.getEditCertificationDefaultInfo(cert));
		model.addAttribute("sparam", param);

		return "/admin/status/certification/edit";
	}
	

	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editCertification.edit", method = RequestMethod.POST)
	public String editCertification(final CertificationEditPO param, @RequestParam("certFile") final MultipartFile[] certFile, @RequestParam("thumFile") final MultipartFile[] thumFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editCertification(param, certFile, thumFile, req));
		
		return "jsonView";
	}
	
	
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteCertification(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}

