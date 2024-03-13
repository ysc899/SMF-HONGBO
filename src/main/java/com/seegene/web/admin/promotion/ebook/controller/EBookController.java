package com.seegene.web.admin.promotion.ebook.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.seegene.web.admin.promotion.ebook.vo.*;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.promotion.ebook.service.EBookService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/promotion/ebook/")
public class EBookController {

	@Autowired
	private EBookService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final EBookSearchPO param, final Model model){
		
		CommonListReuslt<EBookListRO> result = service.findEBookList(param);
		model.addAttribute("result", result);
		model.addAttribute("categorys", service.getCategorys());
		model.addAttribute("sCategory", param.getCodeCategoryType());


		return "/admin/promotion/ebook/list";
	}
	

	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final EBookSearchPO param, final Model model) throws IOException{
		
		EBookViewRO ebook = service.findEbookInfo(seq);
		
		model.addAttribute("result", ebook);
		model.addAttribute("sparam", param);

		return "/admin/promotion/ebook/view";
	}
	
	/**
	 * @param model 모델
	 * @return 인증현황 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final EBookSearchPO param){
		
		model.addAttribute("defaultInfo", service.getAddEbookDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/promotion/ebook/add";
	}

	/**
	 * @param model 모델
	 * @return 연혁 출력 순서
	 */
	@RequestMapping(value="/maxPrintOrder.json", method = RequestMethod.GET)
	public String checkDate(@RequestParam("lang") final String lang,@RequestParam("category") final String category, final Model model){

		model.addAttribute("result", service.maxPrintOrder(lang, category));

		return "jsonView";
	}




	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/addeBook.write", method = RequestMethod.POST)
	public String addeBook(final EBookAddPO param, @RequestParam("thumFile") final MultipartFile[] thumFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{

		model.addAttribute("result", service.addeBook(param, thumFile, req));
		
		return "jsonView";
	}
	
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final int seq, final EBookSearchPO param, final Model model) throws NumberFormatException, IOException{
		
		EBookViewRO ebook = service.findEbookInfo(seq);
		
		model.addAttribute("result", ebook);
		model.addAttribute("defaultInfo", service.getAddEbookDefaultInfo(ebook.getCodeLangType(), ebook.getCodeCategoryType()));
		model.addAttribute("sparam", param);

		return "/admin/promotion/ebook/edit";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editeBook.edit", method = RequestMethod.POST)
	public String editeBook(final EBookEditPO param, @RequestParam("thumFile") final MultipartFile[] thumFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editeBook(param, thumFile, req));
		
		return "jsonView";
	}
	
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{
		
		boolean result = service.deleteeBook(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
