package com.seegene.web.auth.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seegene.web.auth.service.AuthUserService;
import com.seegene.web.auth.vo.UserChangePwPO;
import com.seegene.web.auth.vo.UserLoginPO;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.java.Log;


/**
 * 로그인 컨트롤러
 */
@RequestMapping("/auth")
@Controller
@Log
public class AuthController {
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Autowired
	private AuthUserService authUserService;
	
	

	
	@RequestMapping(value = "/userLogin.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public String userLogin(@RequestBody final UserLoginPO userInfo,final Model model, final HttpServletRequest request,
			@RequestParam(value = "I_DID", required = false) String I_DID){
		request.setAttribute("I_DID", I_DID);
		model.addAttribute("resultCode", authUserService.userLogin(userInfo, request));
		return "jsonView";
	}
	
	
	@RequestMapping(value="/changeUserPw.do", method=RequestMethod.POST)
	public String changeUserPw(@RequestBody final UserChangePwPO param, final HttpServletRequest request, final Model model){
		
		model.addAttribute("resultCode", authUserService.userChangePw(param, request));
		
		return "jsonView"; 
	}
}
