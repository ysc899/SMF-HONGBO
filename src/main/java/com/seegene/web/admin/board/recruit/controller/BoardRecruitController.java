package com.seegene.web.admin.board.recruit.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.board.notice.vo.BoardNoticeEditPO;
import com.seegene.web.admin.board.recruit.service.BoardRecruitService;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitAddPO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitEditPO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitListRO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 공문 컨트롤러
 */
@Controller
@RequestMapping("/admin/board/recruit")
public class BoardRecruitController {
	
	@Autowired
	private BoardRecruitService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<BoardRecruitListRO> result = service.findRecruitList(param);
		model.addAttribute("result", result);
		
		return "/admin/board/recruit/list";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model){
		
		BoardRecruitViewRO recruit = service.findRecruitInfo(seq);
		
		model.addAttribute("result", recruit);
		model.addAttribute("sparam", param);

		return "/admin/board/recruit/view";
	}
	
	
	
	
	/**
	 * @param model 모델
	 * @return 건강정보 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddRecruitDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/board/recruit/add";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 */
	@RequestMapping(value="/addRecruit.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addRecruit(@RequestBody final BoardRecruitAddPO param, final Model model, final HttpServletRequest req) throws IOException{

		model.addAttribute("result", service.addRecruit(param, req));
		
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
	public String editForm(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		BoardRecruitViewRO recruit = service.findRecruitInfo(seq);
		
		model.addAttribute("result", recruit);
		model.addAttribute("defaultInfo", service.getAddRecruitDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/board/recruit/edit";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 */
	@RequestMapping(value="/editRecruit.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editRecruit(@RequestBody final BoardRecruitEditPO param, final Model model, final HttpServletRequest req) throws IOException{

		model.addAttribute("result", service.editRecruit(param, req));

		return "jsonView";
	}
	
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteRecruit(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}

}
