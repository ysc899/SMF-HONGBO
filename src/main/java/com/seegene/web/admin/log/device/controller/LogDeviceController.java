package com.seegene.web.admin.log.device.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.log.access.vo.LogAccessSearchPO;
import com.seegene.web.admin.log.device.service.DeviceService;
import com.seegene.web.admin.log.device.vo.LogDeviceInfoListRO;
import com.seegene.web.admin.log.device.vo.LogDeviceRemovePO;
import com.seegene.web.admin.log.device.vo.LogDeviceSearchPO;
import com.seegene.web.common.CommonListReuslt;

@Controller
@RequestMapping("/admin/log/device")
public class LogDeviceController {

	@Autowired
	private DeviceService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final LogDeviceSearchPO param, final Model model){
		
		CommonListReuslt<LogDeviceInfoListRO> result = service.findDeviceLogList(param);
		model.addAttribute("result", result);
		
		return "/admin/log/device/list";
	}
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/excel.do", method=RequestMethod.GET)
	public void excel(final LogDeviceSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.excelDeviceLogList(param, req, res);
		
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/removes.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
		public String deletes(@RequestBody LogDeviceRemovePO param,  final Model model){
		
		int result = service.deleteLogs(param);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
