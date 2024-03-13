package com.seegene.web.admin.promotion.video.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jcodec.api.JCodecException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.promotion.service.PromotionService;
import com.seegene.web.admin.promotion.vo.PromotionAddPO;
import com.seegene.web.admin.promotion.vo.PromotionEditPO;
import com.seegene.web.admin.promotion.vo.PromotionListRO;
import com.seegene.web.admin.promotion.vo.PromotionViewRO;
import com.seegene.web.admin.promotion.vo.SearchPromotionPO;
import com.seegene.web.common.CommonListReuslt;

@Controller
@RequestMapping("/admin/promotion/video/")
public class PromotionVideoController {
	
	/** 프로모션 타입 */
	private final String PROMOTION_TYPE = "video";
	
	@Autowired
	private PromotionService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPromotionPO param, final Model model){
		
		param.setType(PROMOTION_TYPE);
		
		CommonListReuslt<PromotionListRO> result = service.findPromotionList(param);
		model.addAttribute("result", result);
		
		return "/admin/promotion/video/list";
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq,final SearchPromotionPO param, final Model model) throws IOException{
		
		PromotionViewRO promotion = service.findPromotionInfo(PROMOTION_TYPE, seq);
		model.addAttribute("result", promotion);
		model.addAttribute("sparam", param);

		return "/admin/promotion/video/view";
	}
	
	
	/**
	 * @param model 모델
	 * @return 롤링 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPromotionPO param){
		
		model.addAttribute("defaultInfo", service.getAddPromotionDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/promotion/video/add";
	}
	
	/**
	 * @param model 모델
	 * @return 연혁 출력 순서
	 */
	@RequestMapping(value="/maxPrintOrder.json", method = RequestMethod.GET)
	public String checkDate(@RequestParam("lang") final String lang, final Model model){
		
		model.addAttribute("result", service.maxPrintOrder(PROMOTION_TYPE, lang));
		
		return "jsonView";
	}

	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws JCodecException 
	 */
	@RequestMapping(value="/addPromotion.write", method = RequestMethod.POST)
	public String addPromotion(final PromotionAddPO param, @RequestParam("file") final MultipartFile[] file, @RequestParam("thum") final MultipartFile[] thum, final Model model, final HttpServletRequest req) throws IOException, JCodecException{
		
		model.addAttribute("result", service.addPromotion(PROMOTION_TYPE, param, file, thum, req));
		return "jsonView";
	}
	
	/**
	 * @param seq 식별자
	 * @param req req
	 * @param res res
	 */
	@RequestMapping(value="/stream/{seq}.view", method=RequestMethod.GET)
	public void streamPromotion(@PathVariable("seq") final int seq, final HttpServletRequest req, final HttpServletResponse res){
		service.streamPromotion(seq, PROMOTION_TYPE, req, res);
	}
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final int seq,final SearchPromotionPO param, final Model model) throws NumberFormatException, IOException{
		
		PromotionViewRO promotion = service.findPromotionInfo(PROMOTION_TYPE, seq);
		model.addAttribute("result", promotion);
		model.addAttribute("defaultInfo", service.getEditPromotionDefaultInfo(promotion, PROMOTION_TYPE));
		model.addAttribute("sparam", param);

		return "/admin/promotion/video/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws JCodecException 
	 */
	@RequestMapping(value="/editPromotion.edit", method = RequestMethod.POST)
	public String editPromotion(final PromotionEditPO param, @RequestParam("file") final MultipartFile[] file, @RequestParam("thum") final MultipartFile[] thum, final Model model, final HttpServletRequest req) throws IOException, JCodecException{
		model.addAttribute("result", service.editPromotion(PROMOTION_TYPE, param, file, thum, req));
		return "jsonView";
	}
	
	
	/**
	 * @param seq 로고 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deletePromotion(seq, PROMOTION_TYPE , req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}

