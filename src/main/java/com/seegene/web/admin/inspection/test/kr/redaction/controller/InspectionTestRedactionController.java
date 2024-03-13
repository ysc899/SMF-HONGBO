package com.seegene.web.admin.inspection.test.kr.redaction.controller;

import java.io.IOException;

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
import com.seegene.web.admin.inspection.test.vo.InspSearchPO;
import com.seegene.web.admin.inspection.test.vo.InspectionListRO;
import com.seegene.web.admin.inspection.test.vo.InspectionTestEditVO;
import com.seegene.web.admin.inspection.test.vo.InspectionTestSearchOption;
import com.seegene.web.admin.inspection.test.vo.InspectionViewRO;
import com.seegene.web.common.CommonListReuslt;

/**
 * 사용자가 수정한 내용을 검토 및 마스터 디비(DB2)에 반영 하는 컨트롤러
 */
@Controller
@RequestMapping("/admin/inspection/test/kr/redaction")
public class InspectionTestRedactionController {
	
	@Autowired
	private InspectionTestService service;
	
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final InspSearchPO param, final Model model){
		
		CommonListReuslt<InspectionListRO> result = service.findInspKrList(param);
		model.addAttribute("result", result);
		model.addAttribute("stCodes", service.getRedactionDefaultInfo());
		
		return "/admin/inspection/test/kr/redaction/list";
	}
	
	/**
	 * @param seq 검사항목 수정요청 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final Model model, final HttpServletRequest req) throws IOException{
		
		InspectionViewRO result = service.findInspKrInfo(seq, req);
		
		model.addAttribute("result", result);
		
		return "/admin/inspection/test/kr/redaction/view";
	}
	
	/**
	 * @param param 검사 항목 수정 내용
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 */
	@RequestMapping(value="/apply.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editHistory(@RequestBody final InspectionTestEditVO param, final Model model, final HttpServletRequest req){
		
		
		model.addAttribute("result", service.applyInspKr(param, req));
		
		return "jsonView";
	}
	/**
	 * @param param 검사 항목 수정 내용
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 */
	@RequestMapping(value="/reject.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String rejectInspEn(@RequestBody final InspectionTestEditVO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.rejectInspKr(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/downexcel.do", method=RequestMethod.GET)
	public void downexcel(final InspSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.downInspectionRedactionList(param, "ko", req, res);
		
		
	}
	
}

