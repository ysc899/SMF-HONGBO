package com.seegene.web.admin.health.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.health.service.HealthService;
import com.seegene.web.admin.health.vo.HealthInfoAddPO;
import com.seegene.web.admin.health.vo.HealthInfoEditPO;
import com.seegene.web.admin.health.vo.HealthInfoListRO;
import com.seegene.web.admin.health.vo.HealthInfoTestEditRO;
import com.seegene.web.admin.health.vo.HealthInfoTestHardInfoVO;
import com.seegene.web.admin.health.vo.HealthInfoViewRO;
import com.seegene.web.admin.inspection.test.vo.MWT001R1ListRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 원클릭 건강 정보 관리 컨트롤러
 */
@Controller
@RequestMapping("/admin/health")
public class HealthController {
	
	@Autowired
	private HealthService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<HealthInfoListRO> result = service.findHealthList(param);
		
		model.addAttribute("result", result);
		
		return "/admin/health/list";
	}
	
	/**
	 * @param seq 건강정보 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final String seq, final SearchPaggingCommonPO param,final Model model, final HttpServletRequest req) throws NumberFormatException, IOException{
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		HealthInfoViewRO healthInfo = service.findHealthInfoInfo(Integer.valueOf(seq), req);
		
		model.addAttribute("result", healthInfo);
		model.addAttribute("sparam", param);

		
		return "/admin/health/view";
	}
	
	
	/**
	 * @param seq 검사코드 seq
	 * @param type 수기입력 여부
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/testInfo.json", method=RequestMethod.GET)
	public String testInfo(@RequestParam("seq") final String seq, @RequestParam("type") final String type, final Model model, final HttpServletRequest req){
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		if(StringUtils.isEmpty(type) || !(type.equals("Y") || type.equals("N"))){
			throw new NullPointerException(type);
		}
				
		
		HealthInfoTestHardInfoVO testInfo = service.findHealthTestInfo(Integer.valueOf(seq), type, req);
		
		model.addAttribute("result", testInfo);
		
		return "jsonView";
	}
	/**
	 * @param keyword 검사코드 검색어
	 * @param model
	 * @return 검색된 검사 코드 리스트
	 */
	@RequestMapping(value="/searchTestCodeList.json", method=RequestMethod.GET)
	public String testInfo(@RequestParam("searchKeyword") final String keyword, final Model model, final HttpServletRequest req){
		
		List<MWT001R1ListRO> testInfo = service.searchTestCode(keyword, req);
		
		model.addAttribute("result", testInfo);
		
		return "jsonView";
	}
	
	/**
	 * @param model 모델
	 * @return 건강정보 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model,final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddHealthInfoDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/health/add";
	}
	
	/**
	 * @param seq 검사코드 seq
	 * @param type 수기입력 여부
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/maxPrintOrder.json", method=RequestMethod.GET)
	public String maxPrintOrder(@RequestParam("lang") final String langCode, final Model model){
		
		model.addAttribute("result", service.findMaxPrintOrderByLangCode(langCode));
		
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
	@RequestMapping(value="/addHealthInfo.write",method = RequestMethod.POST)
	public String addAdminMenu(final HealthInfoAddPO param, @RequestParam("thumFile") final MultipartFile thumFile, @RequestParam("contentFile") final MultipartFile contentFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		
		model.addAttribute("result", service.addHealthInfo(param, thumFile, contentFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 건강정보 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final String seq, final SearchPaggingCommonPO param,final Model model, final HttpServletRequest req) throws NumberFormatException, IOException{
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		HealthInfoTestEditRO healthInfo = service.findHealthInfoEditInfo(Integer.valueOf(seq), req);
		model.addAttribute("defaultInfo", service.getEditHealthInfoDefaultInfo(healthInfo));
		model.addAttribute("result", healthInfo);
		model.addAttribute("sparam", param);

		return "/admin/health/edit";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editHealthInfo.edit",method = RequestMethod.POST)
	public String editAdminMenu(final HealthInfoEditPO param, @RequestParam("thumFile") final MultipartFile[] thumFile, @RequestParam("contentFile") final MultipartFile[] contentFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editHealthInfo(param, thumFile, contentFile, req));
		
		return "jsonView";
	}
	
	
	/**
	 * @param seq 건강정보 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final String seq,  final Model model, final HttpServletRequest req) throws NumberFormatException, ClientProtocolException, IOException{
		
		if(StringUtils.isEmpty(seq)  || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		boolean result = service.deleteHealthInfo(Integer.valueOf(seq), req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
