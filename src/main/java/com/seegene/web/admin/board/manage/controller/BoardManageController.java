package com.seegene.web.admin.board.manage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.board.manage.service.BoardManageService;
import com.seegene.web.admin.board.manage.vo.BoardManageAddPO;
import com.seegene.web.admin.board.manage.vo.BoardManageEditPO;
import com.seegene.web.admin.board.manage.vo.BoardManageListRO;
import com.seegene.web.admin.board.manage.vo.BoardManageViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/board/manage")
public class BoardManageController {

	@Autowired
	private BoardManageService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<BoardManageListRO> result = service.findBoardManageList(param);
		
		model.addAttribute("result", result);
		return "/admin/board/manage/list";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		BoardManageViewRO result = service.findBoardManageInfo(seq);
		model.addAttribute("result", result);
		model.addAttribute("sparam", param);

		return "/admin/board/manage/view";
	}
	
	/**
	 * @param model 모델
	 * @return 건강정보 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddBoardManageDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/board/manage/add";
	}
	
	/**
	 * @param param 관리자 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/addBoardManage.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addFaqManage(@RequestBody final BoardManageAddPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.addBoardManage(param, req));
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
	public String editForm(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		
		BoardManageViewRO result = service.findBoardManageInfo(seq);
		model.addAttribute("result", result);
		model.addAttribute("defaultInfo", service.getAddBoardManageDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/board/manage/edit";
	}
	

	/**
	 * @param param 관리자 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 */
	@RequestMapping(value="/editBoardManage.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editFaqManage(@RequestBody final BoardManageEditPO param, final Model model, final HttpServletRequest req){
		
		model.addAttribute("result", service.editBoardManage(param, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteBoardManage(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
