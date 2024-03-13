package com.seegene.web.admin.log.error.controller;

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

import com.seegene.web.admin.log.error.service.LogErrorService;
import com.seegene.web.admin.log.error.vo.LogErrorListRO;
import com.seegene.web.admin.log.error.vo.LogErrorRemovePO;
import com.seegene.web.admin.log.error.vo.LogErrorSearchPO;
import com.seegene.web.admin.log.error.vo.LogErrorViewRO;
import com.seegene.web.common.CommonListReuslt;

@Controller
@RequestMapping("/admin/log/error")
public class LogErrorController {

	@Autowired
	private LogErrorService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final LogErrorSearchPO param, final Model model){
		
		CommonListReuslt<LogErrorListRO> result = service.findErrorLogList(param);
		model.addAttribute("result", result);
		
		return "/admin/log/error/list";
	}
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/excel.do", method=RequestMethod.GET)
	public void excel(final LogErrorSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.excelErrorLogList(param, req, res);
		
	}
	
	/**
	 * @param seq 에러로그 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final long seq, final Model model) throws IOException{
		
		LogErrorViewRO info = service.findErrorLogView(seq);
		
		model.addAttribute("result", info);
		
		return "/admin/log/error/view";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final long seq,  final Model model){
		
		boolean result = service.deleteLog(seq);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/removes.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
		public String deletes(@RequestBody LogErrorRemovePO param,  final Model model){
		int result = service.deleteLogs(param);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
