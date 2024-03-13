package com.seegene.web.admin.inspection.test.kr.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.inspection.test.service.InspectionTestService;
import com.seegene.web.admin.inspection.test.vo.InspExcelPO;
import com.seegene.web.admin.inspection.test.vo.InspectionTestEditLogRO;
import com.seegene.web.admin.inspection.test.vo.InspectionTestEditVO;
import com.seegene.web.admin.inspection.test.vo.InspectionTestSearchOption;
import com.seegene.web.admin.inspection.test.vo.MWT001R2ViewRO;

/**
 * 검사 조회 및 수정사항을 승인자에게 입력 시키는 컨트롤러
 */
@Controller
@RequestMapping("/admin/inspection/test/kr/review")
public class InspectionTestReviewController {
	
	@Autowired
	private InspectionTestService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final InspectionTestSearchOption param, final Model model, final HttpServletRequest req){
		
		String result = service.findInspectionTestKrList(param, req);
		model.addAttribute("result", result);
		model.addAttribute("param", param);
		model.addAttribute("searchOption", service.listSearchOption());
		
		return "/admin/inspection/test/kr/review/list";
	}
	

	/**
	 * @param seq 검사코드
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final String seq, final InspectionTestSearchOption param, final Model model, final HttpServletRequest req) throws IOException{
		
		MWT001R2ViewRO result = service.findInspectionTestKrView(seq, req);
		
		model.addAttribute("result", result);
		model.addAttribute("sparam", param);
		
		return "/admin/inspection/test/kr/review/view";
	}
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/downexcel.do", method=RequestMethod.GET)
	public void downexcel(final InspectionTestSearchOption param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.downInspectionTestKrList(param, req, res);
		
		
	}
	
	/**
	 * @param seq 검사코드
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/editLog/{seq}.json", method=RequestMethod.GET)
	public String editLog(@PathVariable("seq") final String seq, final Model model, final HttpServletRequest req) throws IOException{
		
		List<InspectionTestEditLogRO> result = service.findInspectionKrEditLog(seq);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	/**
	 * @param seq 검사코드
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final String seq, final Model model, final HttpServletRequest req) throws NumberFormatException, IOException{
		
		MWT001R2ViewRO result = service.findInspectionTestKrView(seq, req);
		
		model.addAttribute("result", result);
		
		return "/admin/inspection/test/kr/review/edit";
	}

	/**
	 * @param param 검사 항목 수정 내용
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 */
	@RequestMapping(value="/editInsp.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editInspKr(@RequestBody final InspectionTestEditVO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.editInspKr(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param param 검사 항목 수정 내용
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 */
	@RequestMapping(value="/excel.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editExcelInspKr(@RequestBody final InspExcelPO excelPO, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.editExcelInspKr(excelPO, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 검사코드
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/add.write", method=RequestMethod.GET)
	public String add(final InspectionTestSearchOption param, final Model model, final HttpServletRequest req) throws IOException{
		
		model.addAttribute("sparam", param);
		model.addAttribute("newList", service.reviewAddDefaultInfo(req));
		
		return "/admin/inspection/test/kr/review/add";
	}
	
	/**
	 * @param param 검사 항목 수정 내용
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 */
	@RequestMapping(value="/addInsp.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addInspKr(@RequestBody final InspectionTestEditVO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.addInspKr(param, req));
		
		return "jsonView";
	}
}

