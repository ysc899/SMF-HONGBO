package com.seegene.web.admin.code.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.code.vo.CodeEditPO;
import com.seegene.web.admin.code.vo.CodeMasterListRO;
import com.seegene.web.admin.code.vo.CodeMasterViewRO;
import com.seegene.web.admin.code.vo.CodeSlaveInfoRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

@Controller
@RequestMapping("/admin/code")
public class CodeController {
	
	@Autowired
	private CodeService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<CodeMasterListRO> result = service.findCodeList(param);
		model.addAttribute("result", result);
		
		return "/admin/code/list";
	}
	
	/**
	 * @param seq 코드 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model){
		
		CodeMasterViewRO codeMaster = service.findCodeMasterInfo(seq);
		
		model.addAttribute("result", codeMaster);
		model.addAttribute("sparam", param);

		return "/admin/code/view";
	}
	
	/**
	 * @param seq 코드 seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/slave/{masterCode}/{slaveCode}.json", method=RequestMethod.GET)
	public String slaveInfo(@PathVariable("masterCode") final String masterCode, @PathVariable("slaveCode") final String slaveCode, final Model model){
		
		List<CodeSlaveInfoRO> infos = service.findCodeSlaveInfo(masterCode, slaveCode);
		
		model.addAttribute("result", infos);
		
		return "jsonView";
	}

	/**
	 * @param seq code seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final int seq, final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		CodeMasterViewRO codeMaster = service.findCodeMasterInfo(seq);
		model.addAttribute("result", codeMaster);
		model.addAttribute("langCodes", service.findLangCode());
		model.addAttribute("sparam", param);

		return "/admin/code/edit";
	}
	
	/**
	 * @param param 관리자 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value="/editCode.edit", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String editFaqManage( @RequestBody final CodeEditPO param, final Model model, final HttpServletRequest req) throws ClientProtocolException, IOException{
		
		model.addAttribute("result", service.editCode(param, req));
		
		return "jsonView";
	}
	
	

}
