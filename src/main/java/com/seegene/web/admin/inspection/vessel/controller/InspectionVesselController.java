package com.seegene.web.admin.inspection.vessel.controller;

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

import com.seegene.web.admin.inspection.vessel.service.InspectionVesselService;
import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselListRO;
import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselViewRO;
import com.seegene.web.admin.inspection.vessel.vo.VesselVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/inspection/vessel")
public class InspectionVesselController {

	@Autowired
	private InspectionVesselService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<InspectionVesselListRO> result = service.findVesselList(param);
		model.addAttribute("result", result);
		
		return "/admin/inspection/vessel/list";
	}
	
	/**
	 * @param seq 검체용기 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param,final Model model) throws IOException{
		
		InspectionVesselViewRO vessel = service.findVesselInfo(seq);
		
		model.addAttribute("result", vessel);
		model.addAttribute("sparam", param);

		return "/admin/inspection/vessel/view";
	}
	
	/**
	 * @param model 모델
	 * @return 검체용기 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model,final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddVesselDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/inspection/vessel/add";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/addVessel.write", method = RequestMethod.POST)
	public String addVessel(final VesselVO param, @RequestParam("vesselFile") final MultipartFile vesselFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		
		model.addAttribute("result", service.addVessel(param, vesselFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param model 모델
	 * @return 검사의뢰서 출력 순서
	 */
	@RequestMapping(value="/maxPrintOrder.json", method = RequestMethod.GET)
	public String maxPrintOrder(@RequestParam("lang") final String lang, final Model model){
		
		model.addAttribute("result", service.maxPrintOrder(lang));
		
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
	public String editForm(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model) throws  IOException{
		
		InspectionVesselViewRO vessel = service.findVesselInfo(seq);
		
		model.addAttribute("result", vessel);
		model.addAttribute("defaultInfo", service.getEditVesselDefaultInfo(vessel.getCodeLangType()));
		model.addAttribute("sparam", param);

		return "/admin/inspection/vessel/edit";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editVessel.edit", method = RequestMethod.POST)
	public String editVessel(final VesselVO param, @RequestParam("vesselFile") final MultipartFile[] requestFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editVessel(param, requestFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteVessel(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
