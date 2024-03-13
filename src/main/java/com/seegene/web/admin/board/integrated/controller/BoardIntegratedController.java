package com.seegene.web.admin.board.integrated.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.board.integrated.service.BoardIntegratedService;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedAddPO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedEditPO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedListRO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;

@Controller
@RequestMapping("/admin/board/integrated")
public class BoardIntegratedController {

	@Autowired
	private BoardIntegratedService service;
	
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/{masterSeq}/index.do", method=RequestMethod.GET)
	public String list(@PathVariable("masterSeq") final int masterSeq, final SearchIntegrateSearchPaggingPO param, final Model model) throws Exception{
		
		CommonListReuslt<BoardIntegratedListRO> result = service.findBoardIntegratedList(masterSeq, param);
		
		model.addAttribute("option", service.findMasterOptBySeq(masterSeq));
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		return "/admin/board/integrated/list";
	}
	
	/**
	 * @param seq 게시물 내용 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{masterSeq}/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("masterSeq") final int masterSeq,  @PathVariable("seq") final int seq, final SearchIntegrateSearchPaggingPO param,final Model model) throws NumberFormatException, IOException{
		BoardIntegratedViewRO result = service.findBoardIntegratedView(masterSeq, seq);
		model.addAttribute("option", service.findMasterOptBySeq(masterSeq));
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		model.addAttribute("sparam", param);
		
		String viewPage = "view";
		return "/admin/board/integrated/"+viewPage;
	}
	
	/**
	 * @param seq 게시물 첨부파일 다운로드
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{masterSeq}/download/{seq}/{fileSeq}.do", method=RequestMethod.GET)
	public void download(@PathVariable("masterSeq") final int masterSeq, @PathVariable("seq") final int seq, 
			@PathVariable("fileSeq") final int fileSeq, final HttpServletRequest request,final  HttpServletResponse response) throws IOException{
		service.downloadBoardFile(masterSeq, seq, fileSeq, request, response);
	}
	
	/**
	 * @param masterSeq 부모 seq
	 * @param model 모델
	 * @return faq 내용 등록 페이지
	 */
	@RequestMapping(value="/{masterSeq}/add.write", method = RequestMethod.GET)
	public String addForm(@PathVariable("masterSeq") final int masterSeq, final SearchIntegrateSearchPaggingPO param,final Model model){
		
		model.addAttribute("option", service.findMasterOptBySeq(masterSeq));
		model.addAttribute("masterSeq", masterSeq);
		model.addAttribute("sparam", param);

		String viewPage = "add";
		return "/admin/board/integrated/"+viewPage;
	}
	
	/**
	 * @param masterSeq 부모 seq
	 * @param param 게시판 내용 등록 정보
	 * @param thumFile 섬네일 파일
	 * @param files 첨부 파일
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/{masterSeq}/addBoardIntegrated.write", method = RequestMethod.POST)
	public String addBoardIntegrated(@PathVariable("masterSeq") final int masterSeq, final BoardIntegratedAddPO param, 
			@RequestParam("thumFile") final MultipartFile[] thumFile,
			@RequestParam("files") final MultipartFile[] files,
			final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		model.addAttribute("result", service.addBoardIntegrated(masterSeq, param, thumFile, files, req));

		return "jsonView";
	}
	
	/**
	 * @param seq 공문 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{masterSeq}/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("masterSeq") final int masterSeq, @PathVariable("seq") final int seq, final SearchIntegrateSearchPaggingPO param,final Model model) throws NumberFormatException, IOException{
		
		BoardIntegratedViewRO result = service.findBoardIntegratedView(masterSeq, seq);
		model.addAttribute("option", service.findMasterOptBySeq(masterSeq));
		model.addAttribute("result", result);
		model.addAttribute("masterSeq", masterSeq);
		model.addAttribute("sparam", param);

		String viewPage = "edit";
		return "/admin/board/integrated/"+viewPage;
	}
	
	/**
	 * @param masterSeq 부모 seq
	 * @param param 게시판 내용 등록 정보
	 * @param thumFile 섬네일 파일
	 * @param files 첨부 파일
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 * @throws IOException 
	 */
	@RequestMapping(value="/{masterSeq}/editBoardIntegrated.edit", method = RequestMethod.POST)
	public String editBoardIntegrated(@PathVariable("masterSeq") final int masterSeq, final BoardIntegratedEditPO param, 
			@RequestParam("thumFile") final MultipartFile[] thumFile,
			@RequestParam("files") final MultipartFile[] files,
			final Model model, final HttpServletRequest req) throws IOException{
		
		model.addAttribute("result", service.editBoardIntegrated(masterSeq, param, thumFile, files, req));
		
		return "jsonView";
	}
	
	/**
	 * @param masterSeq 부모 seq
	 * @param seq 내용 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/{masterSeq}/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("masterSeq") final int masterSeq,@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{
		boolean result = service.deleteBoardIntegrated(masterSeq, seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
