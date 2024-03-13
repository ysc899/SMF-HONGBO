package com.seegene.web.admin.log.edit.controller;

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

import com.seegene.web.admin.log.device.vo.LogDeviceSearchPO;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.log.edit.vo.LogEditListRO;
import com.seegene.web.admin.log.edit.vo.LogEditRemovePO;
import com.seegene.web.admin.log.edit.vo.LogEditSearchPO;
import com.seegene.web.admin.log.edit.vo.LogEditViewRO;
import com.seegene.web.common.CommonListReuslt;

@Controller
@RequestMapping("/admin/log/edit")
public class LogEditController {

	@Autowired
	private LogEditService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final LogEditSearchPO param, final Model model){
		
		CommonListReuslt<LogEditListRO> result = service.findEditLogList(param);
		model.addAttribute("result", result);
		
		return "/admin/log/edit/list";
	}
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/excel.do", method=RequestMethod.GET)
	public void excel(final LogEditSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.excelEditLogList(param, req, res);
		
	}
	
	/**
	 * @param seq 검사의뢰서 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final long seq, final Model model) throws IOException{
		
		LogEditViewRO info = service.findEditLogView(seq);
		
		model.addAttribute("result", info);
		
		return "/admin/log/edit/view";
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
		public String deletes(@RequestBody LogEditRemovePO param,  final Model model){
		
		int result = service.deleteLogs(param);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
