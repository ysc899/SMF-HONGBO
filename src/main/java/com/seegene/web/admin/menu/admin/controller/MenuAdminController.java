package com.seegene.web.admin.menu.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.menu.admin.service.MenuAdminService;
import com.seegene.web.admin.menu.admin.vo.MenuAdminAddPO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminEditPO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminListRO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 관리자 메뉴 관리 컨트롤러
 */
@Controller
@RequestMapping("/admin/menu/admin")
public class MenuAdminController {

	@Autowired
	private MenuAdminService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<MenuAdminListRO> result = service.findAdminMenuList(param);
		
		model.addAttribute("result", result);
		
		return "/admin/menu/admin/list";
	}
	
	/**
	 * @param seq 메뉴 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final String seq, final SearchPaggingCommonPO param, final Model model){
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		MenuAdminViewRO menuInfo = service.findAdminMenuInfo(Integer.valueOf(seq));
		
		model.addAttribute("result", menuInfo);
		model.addAttribute("sparam", param);

		return "/admin/menu/admin/view";
	}
	
	/**
	 * @param model 모델
	 * @return 관리자 메뉴 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model,final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddAdminMenuDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/menu/admin/add";
	}
	
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 */
	@RequestMapping(value="/addMenu.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addAdminMenu(@RequestBody final MenuAdminAddPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.addAdminMenu(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 관리자 메뉴 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editView(@PathVariable("seq") final String seq,final SearchPaggingCommonPO param, final Model model){
		
		if(StringUtils.isEmpty(seq)  || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		MenuAdminViewRO menuInfo = service.findAdminMenuInfo(Integer.valueOf(seq));
		
		model.addAttribute("result", menuInfo);
		model.addAttribute("defaultInfo", service.getAddAdminMenuDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/menu/admin/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 */
	@RequestMapping(value="/editMenu.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editAdminMenu(@RequestBody final MenuAdminEditPO param, final Model model, final HttpServletRequest req){

		model.addAttribute("result", service.editAdminMenu(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 관리자 메뉴 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final String seq,  final Model model, final HttpServletRequest req){
		
		if(StringUtils.isEmpty(seq)  || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		boolean result = service.deleteAdminMenu(Integer.valueOf(seq), req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	
}
