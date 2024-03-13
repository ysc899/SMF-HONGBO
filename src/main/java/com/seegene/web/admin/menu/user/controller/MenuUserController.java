package com.seegene.web.admin.menu.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seegene.web.admin.menu.user.service.MenuUserService;
import com.seegene.web.admin.menu.user.vo.MenuUserAddPO;
import com.seegene.web.admin.menu.user.vo.MenuUserEditPO;
import com.seegene.web.admin.menu.user.vo.MenuUserListRO;
import com.seegene.web.admin.menu.user.vo.MenuVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 사용자 메뉴 관리 컨트롤러
 */
@Controller
@RequestMapping("/admin/menu/user")
public class MenuUserController {

	@Autowired
	private MenuUserService service;
	
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<MenuUserListRO> result = service.findUserMenuList(param);
		
		model.addAttribute("result", result);
		
		return "/admin/menu/user/list";
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
		
		MenuVO menuInfo = service.findUserMenuInfo(Integer.valueOf(seq));
		
		model.addAttribute("result", menuInfo);
		model.addAttribute("sparam", param);

		
		return "/admin/menu/user/view";
	}
	
	/**
	 * @param model 모델
	 * @return 관리자 메뉴 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final SearchPaggingCommonPO param, final Model model){
		
		model.addAttribute("defaultInfo", service.getDefaultInfo());
		model.addAttribute("sparam", param);

		
		return "/admin/menu/user/add";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/addMenu.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addAdminMenu(@RequestBody final MenuUserAddPO param, final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{
		
		model.addAttribute("result", service.addUserMenu(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param lang 언어코드
	 * @param model 모델
	 * @return 언어 코드에 대한 헤더 메뉴 정보
	 */
	@RequestMapping("/getHeadParentInfo.json")
	public String getHeadParentInfo(@RequestParam("lang") final String langCode,final Model model){
		
		model.addAttribute("result", service.getHeadParentSelectInfo(langCode));
		
		return "jsonView";
	}
	
	/**
	 * @param lang 언어코드
	 * @param model 모델
	 * @return 언어 코드에 대한 퀵메뉴 카운트 정보
	 */
	@RequestMapping("/getHeadTopCount.json")
	public String getHeadTopCount(@RequestParam("lang") final String langCode,final Model model){
		model.addAttribute("result", service.getHeadTopCount(langCode));
		return "jsonView";
	}
	/**
	 * @param lang 언어코드
	 * @param model 모델
	 * @return 언어 코드에 대한 퀵메뉴 카운트 정보
	 */
	@RequestMapping("/getQuickTopCount.json")
	public String getQuicTopkCount(@RequestParam("lang") final String langCode,final Model model){
		model.addAttribute("result", service.getQuickTopCount(langCode));
		return "jsonView";
	}
	
	/**
	 * @param seq 사용자 메뉴 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editView(@PathVariable("seq") final String seq,final SearchPaggingCommonPO param, final Model model){
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		MenuVO menuInfo = service.findUserMenuInfo(Integer.valueOf(seq));
		
		model.addAttribute("result", menuInfo);
		model.addAttribute("defaultInfo", service.getDefaultInfo());
		model.addAttribute("parentSize", service.getParentSize(menuInfo));
		model.addAttribute("childSize", service.getChildSize(Integer.valueOf(seq)));
		model.addAttribute("sparam", param);

		return "/admin/menu/user/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/editMenu.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editAdminMenu(@RequestBody final MenuUserEditPO param, final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{

		model.addAttribute("result", service.editUserMenu(param, req));
		
		return "jsonView";
	}

	
	/**
	 * @param seq 사용자 메뉴 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final String seq,  final Model model, final HttpServletRequest req) throws NumberFormatException, ClientProtocolException, IOException{
		
		if(StringUtils.isEmpty(seq)  || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		boolean result = service.deleteUserMenu(Integer.valueOf(seq), req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
