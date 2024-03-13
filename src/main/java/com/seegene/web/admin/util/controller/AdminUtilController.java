package com.seegene.web.admin.util.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.user.vo.EditMyInfoPO;
import com.seegene.web.admin.util.service.AdminUtilService;

/**
 * 관리자 웹 유틸용
 */
@Controller
@RequestMapping("/admin/util")
public class AdminUtilController {

	@Autowired
	private AdminUtilService service;
	
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws Exception 
	 */
	@RequestMapping(value="/pdf2Image.json",method = RequestMethod.POST)
	public String pdf2Image(@RequestParam("files") final MultipartFile file, final Model model) throws Exception{
		
		List<String> result = service.pdf2Image(file);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}

	@RequestMapping(value="/editMyInfo.json",method = RequestMethod.POST)
	public String editMyInfo(@RequestBody final EditMyInfoPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result",service.editMyInfo(param, req));
		
		return "jsonView";
	}
	
	
	
}
