package com.seegene.web.admin.log.access.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.log.access.service.LogAccessService;
import com.seegene.web.admin.log.access.vo.LogAccessListRO;
import com.seegene.web.admin.log.access.vo.LogAccessRemovePO;
import com.seegene.web.admin.log.access.vo.LogAccessSearchPO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/log/access")
public class LogAccessController {

	@Autowired
	private LogAccessService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final LogAccessSearchPO param, final Model model){
		
		CommonListReuslt<LogAccessListRO> result = service.findAccessLogList(param);
		model.addAttribute("result", result);
		
		return "/admin/log/access/list";
	}
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/excel.do", method=RequestMethod.GET)
	public void excel(final LogAccessSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.excelAccessLogList(param, req, res);
		
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/removes.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
		public String deletes(@RequestBody LogAccessRemovePO param,  final Model model){
		
		int result = service.deleteLogs(param);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
