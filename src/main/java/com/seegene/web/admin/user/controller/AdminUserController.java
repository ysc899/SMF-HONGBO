package com.seegene.web.admin.user.controller;

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

import com.seegene.web.admin.user.service.AdminUserService;
import com.seegene.web.admin.user.vo.AdminInfoRO;
import com.seegene.web.admin.user.vo.AdminUserPO;
import com.seegene.web.admin.user.vo.AdminUserVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@RequestMapping("/admin/user")
@Controller
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		
		CommonListReuslt<AdminUserVO> result = adminUserService.findAdminList(param);
		
		model.addAttribute("result", result);
		
		return "/admin/user/list";
	}
	
	/**
	 * @param userId 관리자 id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{id}.view", method=RequestMethod.GET)
	public String view(@PathVariable("id") final String userId, final SearchPaggingCommonPO param, final Model model){
		
		if(StringUtils.isEmpty(userId)){
			throw new NullPointerException(userId);
		}
		
		AdminInfoRO userInfo = adminUserService.findAdminInfo(userId);
		
		model.addAttribute("result", userInfo);
		
		model.addAttribute("sparam", param);
		
		return "/admin/user/view";
	}
	
	
	
	/**
	 * @param model 모델
	 * @return 관리자 등록 페이지
	 */
	@RequestMapping(value="/addAdmin.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", adminUserService.getAddAdminDefaultInfo());
		
		model.addAttribute("sparam", param);
		
		return "/admin/user/add";
	}
	
	/**
	 * @param userId 확인할 id
	 * @param model 모델
	 * @return id 중복 결과
	 */
	@RequestMapping("/checkUserId.json")
	public String checkUserId(@RequestParam("userId") final String userId ,final Model model){
		
		model.addAttribute("result", adminUserService.checkUserId(userId));
		
		return "jsonView";
	}
	
	/**
	 * @param userId 확인할 id
	 * @param model 모델
	 * @return id 중복 결과
	 */
	@RequestMapping("/getRoleInfo.json")
	public String getRoleInfo(@RequestParam("roleName") final String roleName ,final Model model){
		
		model.addAttribute("result", adminUserService.findRoleInfo(roleName));
		
		return "jsonView";
	}
	
	/**
	 * @param param 관리자 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/addAdmin.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addAdminUser(@RequestBody final AdminUserPO param, final Model model, final HttpServletRequest req){
		
		int result = 0;
		
		if(StringUtils.isEmpty(param.getUserId())){
			//아이디 없음
			result = -9;
		}else if(StringUtils.isEmpty(param.getPassword()) || StringUtils.isEmpty(param.getCheckPassword()) || !param.getPassword().equals(param.getCheckPassword())){
			//비밀번호 확인 필요
			result = -8;
		}else if(param.getReadSeqs().length == 0){
			//입력된 권한이 없음
			result = -7;
		}else{
			result = adminUserService.addAdminUser(param, req);
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	
	/**
	 * @param userId 관리자 id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{id}.edit", method=RequestMethod.GET)
	public String editView(@PathVariable("id") final String userId, final SearchPaggingCommonPO param, final Model model ){
		
		if(StringUtils.isEmpty(userId)){
			throw new NullPointerException(userId);
		}
		
		AdminInfoRO userInfo = adminUserService.findAdminInfo(userId);
		
		model.addAttribute("result", userInfo);
		model.addAttribute("defaultInfo", adminUserService.getAddAdminDefaultInfo());
		model.addAttribute("sparam", param);
		
		return "/admin/user/edit";
	}
	
	/**
	 * 관리자 수정
	 * @param param 수정할 파라미터
	 * @param model 모델
	 * @param req req
	 * @return
	 */
	@RequestMapping(value="/editAdmin.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editAdminUser(@RequestBody final AdminUserPO param, final Model model, final HttpServletRequest req){
		
		int result = 0;
		
		if(StringUtils.isEmpty(param.getUserId())){
			//아이디 없음
			result = -9;
		}else if(!param.getPassword().equals(param.getCheckPassword())){
			//비밀번호 확인 필요
			result = -8;
		}else if(param.getReadSeqs().length == 0){
			//입력된 권한이 없음
			result = -7;
		}else{
			result = adminUserService.editAdminUser(param, req);
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	
	/**
	 * @param userId 관리자 id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{id}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("id") final String userId,  final Model model, final HttpServletRequest req){
		
		if(StringUtils.isEmpty(userId)){
			throw new NullPointerException(userId);
		}
		
		boolean result = adminUserService.deleteAdminUser(userId, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	
	
}
