package com.seegene.web.admin.main.rolling.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seegene.web.admin.main.rolling.service.MainRollingService;
import com.seegene.web.admin.main.rolling.vo.MainRollingAddPO;
import com.seegene.web.admin.main.rolling.vo.MainRollingEditPO;
import com.seegene.web.admin.main.rolling.vo.MainRollingListRO;
import com.seegene.web.admin.main.rolling.vo.MainRollingViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 메인 롤링 관리
 */
@Controller
@RequestMapping("/admin/main/rolling")
public class MainRollingController {
	
	@Autowired
	private MainRollingService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<MainRollingListRO> result = service.findRollingList(param);
		model.addAttribute("result", result);
		
		return "/admin/main/rolling/list";
	}
	
	/**
	 * @param seq 롤링 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model){
		
		MainRollingViewRO rolling = service.findRollingInfo(seq);
		
		model.addAttribute("result", rolling);
		model.addAttribute("sparam", param);

		return "/admin/main/rolling/view";
	}
	
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddRollingDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/main/rolling/add";
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
	 */
	@RequestMapping(value="/addRolling.write", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String addRecruit(@RequestBody final MainRollingAddPO param, final Model model, final HttpServletRequest req) throws IOException{
		model.addAttribute("result", service.addRolling(param, req));
		
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
		
		MainRollingViewRO rolling = service.findRollingInfo(seq);
		
		model.addAttribute("result", rolling);
		model.addAttribute("defaultInfo", service.getEditRecruitDefaultInfo(rolling.getCodeLangType()));
		model.addAttribute("sparam", param);

		return "/admin/main/rolling/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 수정 결과
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/editRolling.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editRolling(@RequestBody final MainRollingEditPO param, final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{

		model.addAttribute("result", service.editRolling(param, req));

		return "jsonView";
	}
	
	
	/**
	 * @param seq 롤링 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{
		
		boolean result = service.deleteRolling(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}

}
