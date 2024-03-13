package com.seegene.web.admin.status.network.controller;

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

import com.seegene.web.admin.status.network.service.NetworkService;
import com.seegene.web.admin.status.network.vo.NetworkAddPO;
import com.seegene.web.admin.status.network.vo.NetworkEditPO;
import com.seegene.web.admin.status.network.vo.NetworkListRO;
import com.seegene.web.admin.status.network.vo.NetworkViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 전국 네트워크 컨트롤러
 */
@Controller
@RequestMapping("/admin/status/network")
public class NetworkController {
	
	@Autowired
	private NetworkService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<NetworkListRO> result = service.findNetworkList(param);
		model.addAttribute("result", result);
		
		return "/admin/status/network/list";
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
		
		NetworkViewRO network = service.findNetworkList(seq);
		
		model.addAttribute("result", network);
		model.addAttribute("viewSeq", seq);
		model.addAttribute("sparam", param);

		return "/admin/status/network/view";
	}
	
	/**
	 * @param model 모델
	 * @return 인증현황 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddNetworkDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/status/network/add";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/addNetwork.write", method = RequestMethod.POST)
	public String addNetwork(final NetworkAddPO param,  @RequestParam("thumFile") final MultipartFile[] thumFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.addNetwork(param, thumFile, req));
		
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
		
		NetworkViewRO network = service.findNetworkList(seq);
		
		model.addAttribute("result", network);
		model.addAttribute("defaultInfo", service.getAddNetworkDefaultInfo());
//		model.addAttribute("viewSeq", seq);
		model.addAttribute("sparam", param);

		return "/admin/status/network/edit";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	@RequestMapping(value="/editNetwork.edit", method = RequestMethod.POST)
	public String editNetwork(final NetworkEditPO param,  @RequestParam("thumFile") final MultipartFile[] thumFile, final Model model, final HttpServletRequest req) throws IOException, InterruptedException{
		
		model.addAttribute("result", service.editNetwork(param, thumFile, req));
		
		return "jsonView";
	}
	
	/**
	 * @param seq 네트워크 사용자 seq
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{seq}.delete", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String delete(@PathVariable("seq") final int seq,  final Model model, final HttpServletRequest req){
		
		boolean result = service.deleteNetworkStaffs(seq, req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
