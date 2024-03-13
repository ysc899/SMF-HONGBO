package com.seegene.web.admin.log.statistics.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.log.access.service.LogAccessService;
import com.seegene.web.admin.log.access.vo.LogStatisPO;

@Controller
@RequestMapping("/admin/log/statistics")
public class LogStatisticsController {

	@Autowired
	private LogAccessService service;
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user/index.do", method=RequestMethod.GET)
	public String userIndex(final Model model){
		
		return "/admin/log/statistics/user/index";
	}
	
	@RequestMapping(value="/user/static.json", method=RequestMethod.GET)
	public String userStaticData(final LogStatisPO param, final Model model){
		
		model.addAttribute("result",service.userStaticData(param));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/user/yearStatic.json", method=RequestMethod.GET)
	public String userYearStaticData(final LogStatisPO param, final Model model){
		
		model.addAttribute("result",service.userYearStaticData(param));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/user/yearStaticExcel.do", method=RequestMethod.GET)
	public void yearStaticExcel(final LogStatisPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.userYearStaticDataExcel(param, req, res);
		
	}
	
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/menu/index.do", method=RequestMethod.GET)
	public String menuIndex(final Model model){
		
		return "/admin/log/statistics/menu/index";
	}
	
	@RequestMapping(value="/menu/static.json", method=RequestMethod.GET)
	public String menuStaticData(final LogStatisPO param, final Model model){
		
		model.addAttribute("result",service.menuStaticData(param));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/menu/staticExcel.do", method=RequestMethod.GET)
	public void menuStaticExcel(final LogStatisPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.menuStaticExcel(param, req, res);
		
	}
	
	/**
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/device/index.do", method=RequestMethod.GET)
	public String deviceIndex(final Model model){
		
		return "/admin/log/statistics/device/index";
	}
	
	@RequestMapping(value="/device/static.json", method=RequestMethod.GET)
	public String deviceStaticData(final LogStatisPO param, final Model model){
		
		model.addAttribute("result",service.deviceStaticData(param));
		
		return "jsonView";
	}
	
	@RequestMapping(value="/device/staticExcel.do", method=RequestMethod.GET)
	public void deviceStaticExcel(final LogStatisPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException{
		
		service.deviceStaticExcel(param, req, res);
		
	}
}
