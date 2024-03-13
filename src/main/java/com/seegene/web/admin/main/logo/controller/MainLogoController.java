package com.seegene.web.admin.main.logo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.main.logo.service.MainLogoService;
import com.seegene.web.admin.main.logo.vo.MainLogoAddPO;
import com.seegene.web.admin.main.logo.vo.MainLogoCheckDatePO;
import com.seegene.web.admin.main.logo.vo.MainLogoCheckEditDatePO;
import com.seegene.web.admin.main.logo.vo.MainLogoEditPO;
import com.seegene.web.admin.main.logo.vo.MainLogoListRO;
import com.seegene.web.admin.main.logo.vo.MainLogoViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 메인 로고 관리
 */
@Controller
@RequestMapping("/admin/main/logo")
public class MainLogoController {
	
	@Autowired
	private MainLogoService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<MainLogoListRO> result = service.findLogoList(param);
		model.addAttribute("result", result);
		
		return "/admin/main/logo/list";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model) throws IOException{
		
		MainLogoViewRO logo = service.findLogoInfo(seq);
		
		model.addAttribute("result", logo);
		model.addAttribute("sparam", param);

		return "/admin/main/logo/view";
	}
	
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddLogoDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/main/logo/add";
	}

	
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/checkDate.json", method = RequestMethod.GET)
	public String checkDate(final MainLogoCheckDatePO param, final Model model){
		
		model.addAttribute("result", service.checkDate(param));
		
		return "jsonView";
	}
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/checkEditDate.json", method = RequestMethod.GET)
	public String checkEditDate(final MainLogoCheckEditDatePO param, final Model model){
		
		model.addAttribute("result", service.checkDate(param));
		
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
	@RequestMapping(value="/addLogo.write", method = RequestMethod.POST)
	public String addRecruit(final MainLogoAddPO param, @RequestParam("files") final MultipartFile file, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.addLogo(param, file, req));
		
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
	public String editForm(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		MainLogoViewRO logo = service.findLogoInfo(seq);
		
		model.addAttribute("result", logo);
		model.addAttribute("defaultInfo", service.getAddLogoDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/main/logo/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editLogo.edit", method = RequestMethod.POST)
	public String editLogo(final MainLogoEditPO param,@RequestParam("files") final MultipartFile[] files, final Model model, final HttpServletRequest req)throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editLogo(param, files, req));

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
		
		boolean result = service.deleteLogo(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}

}
