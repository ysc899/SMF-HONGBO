package com.seegene.web.admin.main.popup.controller;

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

import com.seegene.web.admin.main.popup.service.MainPopupService;
import com.seegene.web.admin.main.popup.vo.MainPopupAddPO;
import com.seegene.web.admin.main.popup.vo.MainPopupEditPO;
import com.seegene.web.admin.main.popup.vo.MainPopupListRO;
import com.seegene.web.admin.main.popup.vo.MainPopupViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 메인 로고 관리
 */
@Controller
@RequestMapping("/admin/main/popup")
public class MainPopupController {
	
	@Autowired
	private MainPopupService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<MainPopupListRO> result = service.findPopupList(param);
		model.addAttribute("result", result);
		
		return "/admin/main/popup/list";
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
		
		MainPopupViewRO popup = service.findPopupInfo(seq);
		
		model.addAttribute("result", popup);
		model.addAttribute("sparam", param);

		return "/admin/main/popup/view";
	}
	
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddPopupDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/main/popup/add";
	}

	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/addPopup.write", method = RequestMethod.POST)
	public String addPopup(final MainPopupAddPO param, @RequestParam("files") final MultipartFile file, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.addPopup(param, file, req));
		
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
		
		MainPopupViewRO popup = service.findPopupInfo(seq);
		
		model.addAttribute("result", popup);
		model.addAttribute("defaultInfo", service.getAddPopupDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/main/popup/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editPopup.edit", method = RequestMethod.POST)
	public String editPopup(final MainPopupEditPO param,@RequestParam("files") final MultipartFile[] files, final Model model, final HttpServletRequest req)throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editPopup(param, files, req));

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
		
		boolean result = service.deletePopup(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}

}
