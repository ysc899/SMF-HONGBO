package com.seegene.web.admin.status.staffs.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.status.staffs.service.StaffsService;
import com.seegene.web.admin.status.staffs.vo.StaffsAddPO;
import com.seegene.web.admin.status.staffs.vo.StaffsEditPO;
import com.seegene.web.admin.status.staffs.vo.StaffsListRO;
import com.seegene.web.admin.status.staffs.vo.StaffsViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 의료진 현황 컨트롤러
 */
@Controller
@RequestMapping("/admin/status/staffs")
public class StaffsController {
	
	@Autowired
	private StaffsService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<StaffsListRO> result = service.findStaffsList(param);
		model.addAttribute("result", result);
		
		return "/admin/status/staffs/list";
	}
	
	/**
	 * @param seq 의료진 정보 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model) throws IOException{
		
		StaffsViewRO result = service.findStaffsInfo(seq);
		
		model.addAttribute("result", result);
		model.addAttribute("sparam", param);

		return "/admin/status/staffs/view";
	}
	
	/**
	 * @param model 모델
	 * @return 인증현황 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddStaffsDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/status/staffs/add";
	}
	
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/addStaffs.write", method = RequestMethod.POST)
	public String addStaffs(final StaffsAddPO param,  @RequestParam("thumFile") final MultipartFile[] thumFile, @RequestParam("contentFile") final MultipartFile[] contentFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.addStaffs(param, thumFile, contentFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param model 모델
	 * @return 의료진 현황 출력 순서
	 */
	@RequestMapping(value="/maxPrintOrder.json", method = RequestMethod.GET)
	public String checkDate(@RequestParam("center") final String center, @RequestParam("part") final String part,@RequestParam("master") final boolean master , final Model model){
		
		model.addAttribute("result", service.maxPrintOrder(center, part, master));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 의료진 정보 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final int seq,final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		StaffsViewRO result = service.findStaffsInfo(seq);
		
		model.addAttribute("result", result);
		model.addAttribute("defaultInfo", service.getEditStaffsDefaultInfo(result));
		model.addAttribute("sparam", param);

		return "/admin/status/staffs/edit";
	}
	
	/**
	 * @param param 수정 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editStaffs.edit", method = RequestMethod.POST)
	public String editStaffs(final StaffsEditPO param,  @RequestParam("thumFile") final MultipartFile[] thumFile, @RequestParam("contentFile") final MultipartFile[] contentFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editStaffs(param, thumFile, contentFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 의료진 정보 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteStaffs(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}

