package com.seegene.web.admin.status.history.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seegene.web.admin.status.history.service.HistoryService;
import com.seegene.web.admin.status.history.vo.HistoryAddPO;
import com.seegene.web.admin.status.history.vo.HistoryEditPO;
import com.seegene.web.admin.status.history.vo.HistoryListRO;
import com.seegene.web.admin.status.history.vo.HistoryViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/status/history")
public class HistoryController {

	@Autowired
	private HistoryService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<HistoryListRO> result = service.findHistoryList(param);
		model.addAttribute("result", result);
		
		return "/admin/status/history/list";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model) throws IOException{
		
		HistoryViewRO history = service.findHistoryInfo(seq);
		
		model.addAttribute("result", history);
		model.addAttribute("sparam", param);

		return "/admin/status/history/view";
	}
	
	/**
	 * @param model 모델
	 * @return 인증현황 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddHistoryDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/status/history/add";
	}
	
	/**
	 * @param param 연혁 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/addHistory.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addHistory(@RequestBody final HistoryAddPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.addHistory(param, req));
		
		return "jsonView";
	}
	
	
	/**
	 * @param model 모델
	 * @return 연혁 출력 순서
	 */
	@RequestMapping(value="/maxPrintOrder.json", method = RequestMethod.GET)
	public String checkDate(@RequestParam("lang") final String lang, @RequestParam("date") final String date, final Model model){
		
		model.addAttribute("result", service.maxPrintOrder(lang, date));
		
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
	public String editForm(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		HistoryViewRO history = service.findHistoryInfo(seq);
		model.addAttribute("result", history);
		model.addAttribute("defaultInfo", service.getEditHistoryDefaultInfo(history));
		model.addAttribute("sparam", param);

		return "/admin/status/history/edit";
	}
	
	/**
	 * @param param 연혁 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/editHistory.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editHistory(@RequestBody final HistoryEditPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.editHistory(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteHistory(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
