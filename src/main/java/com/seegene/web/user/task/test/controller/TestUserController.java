package com.seegene.web.user.task.test.controller;

import com.google.zxing.WriterException;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.user.task.test.service.TestUserService;
import com.seegene.web.user.task.test.vo.TestSearchOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Locale;


@Controller
@RequestMapping("/task/test")
public class TestUserController {
	
	@Autowired
	private TestUserService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final TestSearchOption param, final Locale locale,  final Model model, final HttpServletRequest request) throws Exception{
		
		if(locale.getLanguage().equals("ko")){
			model.addAttribute("searchOption", service.getDefaultData(locale.getLanguage()));
			model.addAttribute("result",service.getTestDataList(param, locale.getLanguage(), request));
			model.addAttribute("sparam", param);
			return "/user/task/test/index";
		}else{
			model.addAttribute("searchOption", service.getDefaultData(locale.getLanguage()));
			model.addAttribute("result",service.getTestDataList(param, locale.getLanguage(), request));
			model.addAttribute("sparam", param);
			return "/user/task/test/en/index";
		}
	}
	
	
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String viewInfo(@PathVariable("seq") final String seq, final Locale locale, final Model model,final TestSearchOption param, final HttpServletRequest request) throws IOException, WriterException {
		
		
		if(locale.getLanguage().equals("ko")){
			model.addAttribute("loginYn", SessionUtil.isLogin());
			model.addAttribute("result",service.getTestDataView(seq, locale.getLanguage(), request));
			model.addAttribute("sparam", param);
			return "/user/task/test/view";
		}else{
			model.addAttribute("loginYn", SessionUtil.isLogin());
			model.addAttribute("result",service.getTestDataView(seq, locale.getLanguage(), request));
			model.addAttribute("sparam", param);
			return "/user/task/test/en/view";
		}
	}

}
