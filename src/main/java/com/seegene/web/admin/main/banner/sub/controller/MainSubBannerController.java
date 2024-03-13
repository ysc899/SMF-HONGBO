package com.seegene.web.admin.main.banner.sub.controller;

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

import com.seegene.web.admin.main.banner.sub.service.MainSubBannerService;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerAddPO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerEditPO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerListRO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 메인 롤링 관리
 */
@Controller
@RequestMapping("/admin/main/banner/sub")
public class MainSubBannerController {
	
	@Autowired
	private MainSubBannerService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<MainSubBannerListRO> result = service.findSubBannerList(param);
		model.addAttribute("result", result);
		
		return "/admin/main/banner/sub/list";
	}
	
	/**
	 * @param seq 롤링 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model) throws IOException{
		
		MainSubBannerViewRO banner = service.findSubBannerInfo(seq);
		
		model.addAttribute("result", banner);
		model.addAttribute("sparam", param);

		return "/admin/main/banner/sub/view";
	}
	
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddSubBannerDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/main/banner/sub/add";
	}

	
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/getPrintOrder.json", method = RequestMethod.GET)
	public String getPrintOrder(@RequestParam("lang") final String langCode, final Model model){
		
		model.addAttribute("result", service.getPrintOrder(langCode));
		
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
	@RequestMapping(value="/addSubBanner.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addSubBanner(final MainSubBannerAddPO param, @RequestParam("files") final MultipartFile file, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{

		model.addAttribute("result", service.addSubBanner(param, file, req));
		
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
	public String editForm(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param,final Model model) throws NumberFormatException, IOException{
		
		MainSubBannerViewRO banner = service.findSubBannerInfo(seq);
		
		model.addAttribute("result", banner);
		
		model.addAttribute("defaultInfo", service.getEditSubBannerDefaultInfo(banner.getCodeLangType()));
		model.addAttribute("sparam", param);

		return "/admin/main/banner/sub/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 * @throws InterruptedException 
	 * @throws IOException 
	 */
	@RequestMapping(value="/editSubBanner.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editSubBanner(final MainSubBannerEditPO param,@RequestParam("files") final MultipartFile[] file, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{

		model.addAttribute("result", service.editSubBanner(param, file,req));

		return "jsonView";
	}
	
//	
	/**
	 * @param seq 롤링 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{
		
		boolean result = service.deleteSubBanner(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}

}
