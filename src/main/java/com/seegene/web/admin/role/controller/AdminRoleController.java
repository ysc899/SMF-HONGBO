package com.seegene.web.admin.role.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seegene.web.admin.role.service.AdminRoleService;
import com.seegene.web.admin.role.vo.AdminRoleVO;
import com.seegene.web.admin.role.vo.RoleInfoRO;
import com.seegene.web.admin.role.vo.RolePO;
import com.seegene.web.admin.user.vo.AdminInfoRO;
import com.seegene.web.admin.user.vo.AdminUserPO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@RequestMapping("/admin/role")
@Controller
public class AdminRoleController {

	@Autowired
	private AdminRoleService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		
		CommonListReuslt<AdminRoleVO> result = service.findRoleList(param);
		model.addAttribute("result", result);
		
		return "/admin/role/list";
	}
	
	/**
	 * @param roleName 롤 이름
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{id}.view", method=RequestMethod.GET)
	public String view(@PathVariable("id") final String roleName,final SearchPaggingCommonPO param, final Model model){
		
		if(StringUtils.isEmpty(roleName)){
			throw new NullPointerException(roleName);
		}
		
		RoleInfoRO roleInfo = service.findRoleInfo(roleName);
		
		model.addAttribute("result", roleInfo);
		model.addAttribute("sparam", param);

		
		return "/admin/role/view";
	}
	
	/**
	 * @param model 모델
	 * @return Role 등록 페이지
	 */
	@RequestMapping(value="/addRole.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("menus", service.getDefaultMenuList());
		model.addAttribute("sparam", param);

		return "/admin/role/add";
	}
	
	/**
	 * @param roleName 확인할 롤 name
	 * @param model 모델
	 * @return 롤 name 중복 결과
	 */
	@RequestMapping("/checkRoleId.json")
	public String checkUserId(@RequestParam("roleName") final String roleName, final Model model){
		
		model.addAttribute("result", service.checkRoleName(roleName));
		
		return "jsonView";
	}
	
	/**
	 * @param param 등록될 롤 정보
	 * @param model 모델
	 * @param req	req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/addRole.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addRole(@RequestBody final RolePO param, final Model model, final HttpServletRequest req){
		int result = 0;
		
		if(StringUtils.isEmpty(param.getRoleName())){
			//아이디 없음
			result = -9;
		}else if(param.getReadSeqs().length == 0){
			//입력된 권한이 없음
			result = -7;
		}else{
			result = service.addRole(param, req);
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	

	/**
	 * @param roleName 롤 이름
	 * @param model 모델
	 * @return 페이지
	 */
	@RequestMapping(value="/{roleName}.edit", method=RequestMethod.GET)
	public String editView(@PathVariable("roleName") final String roleName, final SearchPaggingCommonPO param, final Model model){
		
		if(StringUtils.isEmpty(roleName)){
			throw new NullPointerException(roleName);
		}
		
		RoleInfoRO roleInfo = service.findRoleInfo(roleName);
		
		model.addAttribute("result", roleInfo);
		model.addAttribute("menus", service.getDefaultMenuList());
		model.addAttribute("sparam", param);

		return "/admin/role/edit";
	}
	
	/**
	 * 롤 수정
	 * @param param 수정할 파라미터
	 * @param model 모델
	 * @param req req
	 * @return
	 */
	@RequestMapping(value="/editRole.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editRole(@RequestBody final RolePO param, final Model model, final HttpServletRequest req){
		
		int result = 0;
		
		if(StringUtils.isEmpty(param.getRoleName())){
			//아이디 없음
			result = -9;
		}else if(param.getReadSeqs().length == 0){
			//입력된 권한이 없음
			result = -7;
		}else{
			result = service.editRole(param, req);
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	/**
	 * @param roleName 롤 id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{roleName}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("roleName") final String roleName,  final Model model, final HttpServletRequest req){
		
		if(StringUtils.isEmpty(roleName)){
			throw new NullPointerException(roleName);
		}
		
		boolean result = service.deleteRole(roleName, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
