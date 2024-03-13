package com.seegene.web.user.board.integrated.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.board.integrated.vo.BoardOptInfoRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.user.board.integrated.service.BoardService;
import com.seegene.web.user.board.integrated.vo.BoardListRO;
import com.seegene.web.user.board.integrated.vo.BoardViewRO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/{masterSeq}/index.do", method=RequestMethod.GET)
	public String list(@PathVariable("masterSeq") final int masterSeq, final SearchIntegrateSearchPaggingPO param, final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
		
		BoardOptInfoRO option = service.findMasterOptBySeq(masterSeq);
		if(2 == masterSeq){
			param.setLimit(6);
		}
		CommonListReuslt<BoardListRO>  result = service.findBoardList(masterSeq, param, option, locale);
		model.addAttribute("option", option);
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		
		if(option.getOptNotiFlag().equals("Y")){
			model.addAttribute("notice", service.findBoardNoticeList(masterSeq));
		}
		
		String viewPage = "list_index";

		if(option.getOptThumFlag().equals("Y")){
			if(2 == masterSeq){
				viewPage = "new_list_index";
			}else{
				viewPage = "thum_index";
			}
		}

		if(locale.getLanguage().equals("ko")){
			return "/user/board/integrated/"+viewPage;
		}else{
			return "/user/board/integrated/en/"+viewPage;
		}

	}
	
	/**
	 * @param masterSeq 검사코드 seq
	 * @param param 수기입력 여부
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{masterSeq}/moreInfo.json", method=RequestMethod.GET)
	public String moreInfo(@PathVariable("masterSeq") final int masterSeq, final SearchIntegrateSearchPaggingPO param, final Locale locale, final Model model){
		
		List<BoardListRO> result = service.findBoardListContent(masterSeq, param, locale);
		model.addAttribute("result", result);
		
		
		return "jsonView";
	}
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/{masterSeq}/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("masterSeq") final int masterSeq,@PathVariable("seq") final int seq, final SearchIntegrateSearchPaggingPO param, final Locale locale, final Model model, final HttpServletRequest request) throws Exception{
		
		BoardOptInfoRO option = service.findMasterOptBySeq(masterSeq);
		BoardViewRO result = service.findBoardView(masterSeq, seq, option, locale);
		model.addAttribute("option", option);
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		
//		return "/user/board/integrated/view";
		if(locale.getLanguage().equals("ko")){
			return "/user/board/integrated/view";
		}else{
			return "/user/board/integrated/en/view";
		}
		
	}

	/**
	 * @param seq 공문 seq
	 * @param masterSeq
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{masterSeq}/thum/{seq}.view", method=RequestMethod.GET)
	public void thumImage(@PathVariable("masterSeq") final int masterSeq, @PathVariable("seq") final int seq,  final HttpServletRequest request, final HttpServletResponse response){
		
		service.findBoardThum(masterSeq, seq, request, response);
		
	}
	
	/**
	 * @param seq 게시판 seq
	 * @param fileSeq 파일 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/{masterSeq}/{seq}/download/{fileSeq}.do", method=RequestMethod.GET)
	public void downloadFile(@PathVariable("masterSeq") final int masterSeq, @PathVariable("seq") final int seq, @PathVariable("fileSeq") final int fileSeq, final HttpServletRequest request,final  HttpServletResponse response){
		
		service.downloadBoardFile(masterSeq, seq, fileSeq, request, response);
	}

	/**
	 * @param seq 보드 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{masterSeq}/{seq}/hitCount.write", method = RequestMethod.POST)
	public String addBoardIntegrated(@PathVariable("masterSeq") final int masterSeq,@PathVariable("seq") final int seq, final SearchIntegrateSearchPaggingPO param, final Locale locale, final Model model, final HttpServletRequest request){
		
		BoardOptInfoRO option = service.findMasterOptBySeq(masterSeq);
		BoardViewRO result = service.findBoardView(masterSeq, seq, option, locale);
		model.addAttribute("option", option);
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		
		return "jsonView";
	}
}
