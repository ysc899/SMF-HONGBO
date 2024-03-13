package com.seegene.web.admin.faq.manage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.faq.manage.service.FaqManageService;
import com.seegene.web.admin.faq.manage.vo.FaqManageAddPO;
import com.seegene.web.admin.faq.manage.vo.FaqManageEditPO;
import com.seegene.web.admin.faq.manage.vo.FaqManageListRO;
import com.seegene.web.admin.faq.manage.vo.FaqManageViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/faq/manage")
public class FaqManageController {

	@Autowired
	private FaqManageService service;
	
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<FaqManageListRO> result = service.findFaqManageList(param);
		
		model.addAttribute("result", result);
		return "/admin/faq/manage/list";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final String seq, final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		FaqManageViewRO result = service.findFaqManageInfo(Integer.valueOf(seq));
		model.addAttribute("result", result);
		model.addAttribute("sparam", param);

		return "/admin/faq/manage/view";
	}
	
	/**
	 * @param model 모델
	 * @return 건강정보 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddFaqManageDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/faq/manage/add";
	}
	
	/**
	 * @param param 관리자 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/addFaqManage.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addFaqManage(@RequestBody final FaqManageAddPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.addFaqManage(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final String seq,final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		
		FaqManageViewRO result = service.findFaqManageInfo(Integer.valueOf(seq));
		model.addAttribute("result", result);
		model.addAttribute("defaultInfo", service.getAddFaqManageDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/faq/manage/edit";
	}
	
	/**
	 * @param param 관리자 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/editFaqManage.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editFaqManage(@RequestBody final FaqManageEditPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.editFaqManage(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final String seq,  final Model model, final HttpServletRequest req){
		
		if(StringUtils.isEmpty(seq)  || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		boolean result = service.deleteFaqManage(Integer.valueOf(seq), req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
