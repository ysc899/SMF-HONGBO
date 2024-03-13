package com.seegene.web.admin.inspection.request.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.inspection.request.service.InspectionRequestService;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestListRO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestVO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/inspection/request")
public class InspectionRequestController {

	@Autowired
	private InspectionRequestService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<InspectionRequestListRO> result = service.findRequestList(param);
		model.addAttribute("result", result);
		
		return "/admin/inspection/request/list";
	}
	
	/**
	 * @param seq 검사의뢰서 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param,final Model model) throws IOException{
		
		InspectionRequestViewRO request = service.findRequestInfo(seq);
		
		model.addAttribute("result", request);
		model.addAttribute("sparam", param);

		return "/admin/inspection/request/view";
	}
	/**
	 * @param seq 검사의뢰서 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/download/{seq}.do", method=RequestMethod.GET)
	public void downloadFile(@PathVariable("seq") final int seq, final HttpServletRequest request,final  HttpServletResponse response){
		
		service.downloadFile(seq, request, response);
	}
	
	/**
	 * @param model 모델
	 * @return 검사의뢰서 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddRequestDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/inspection/request/add";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/addRequest.write", method = RequestMethod.POST)
	public String addRequest(final InspectionRequestVO param, @RequestParam("requestFile") final MultipartFile requestFile, @RequestParam("thumFile") final MultipartFile[] thumFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		
		model.addAttribute("result", service.addRequest(param, requestFile,thumFile,  req));
		
		return "jsonView";
	}
	
	
	/**
	 * @param model 모델
	 * @return 검사의뢰서 출력 순서
	 */
	@RequestMapping(value="/maxPrintOrder.json", method = RequestMethod.GET)
	public String maxPrintOrder(@RequestParam("lang") final String lang, @RequestParam("thumFlag") final boolean thumFlag, final Model model){
		
		model.addAttribute("result", service.maxPrintOrder(lang, thumFlag));
		
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
		
		InspectionRequestViewRO request = service.findRequestInfo(seq);
		
		model.addAttribute("result", request);
		model.addAttribute("defaultInfo", service.getEditRequestDefaultInfo(request));
		model.addAttribute("sparam", param);

		return "/admin/inspection/request/edit";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editdRequest.edit", method = RequestMethod.POST)
	public String editdRequest(final InspectionRequestVO param, @RequestParam("requestFile") final MultipartFile[] requestFile, @RequestParam("thumFile") final MultipartFile[] thumFile,final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editdRequest(param, requestFile, thumFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteRequest(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
