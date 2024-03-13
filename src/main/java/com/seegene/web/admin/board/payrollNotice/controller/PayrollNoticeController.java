package com.seegene.web.admin.board.payrollNotice.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeAddPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeEditPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeListRO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeViewRO;
import com.seegene.web.admin.board.payrollNotice.service.PayrollNoticeService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;

/**
 * 급여 고시  컨트롤러
 */
@Controller
@RequestMapping("/admin/board/payrollNotice")
public class PayrollNoticeController {
	
	@Autowired
	private PayrollNoticeService service;
	
	/**
	 * @param param 검색조건
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String list(final SearchPaggingCommonPO param, final Model model){
		
		CommonListReuslt<PayrollNoticeListRO> result = service.findPayrollNoticeList(param);
		model.addAttribute("result", result);
		
		return "/admin/board/payrollNotice/list";
	}
	
	/**
	 * @param seq 급여 고시  seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.view", method=RequestMethod.GET)
	public String view(@PathVariable("seq") final String seq,final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		PayrollNoticeViewRO payollNotice = service.findPayrollNoticeInfo(Integer.valueOf(seq));
		
		payollNotice.setContent(payollNotice.getContent().replaceAll("&nbsp;", " "));
		
		model.addAttribute("result", payollNotice);
		model.addAttribute("sparam", param);

		return "/admin/board/payrollNotice/view";
	}
	
	
	/**
	 * @param seq 급여 고시  seq
	 * @param fileSeq 파일 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	@RequestMapping(value="/download/{seq}/{fileSeq}.do", method=RequestMethod.GET)
	public void downloadFile(@PathVariable("seq") final String seq, @PathVariable("fileSeq") final String fileSeq, final HttpServletRequest request,final  HttpServletResponse response){
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq) || StringUtils.isEmpty(fileSeq) || !StringUtils.isNumeric(fileSeq)){
			throw new NullPointerException(seq);
		}
		
		service.downloadPayrollNoticeFile(Integer.valueOf(seq), Integer.valueOf(fileSeq), request, response);
	}
	
	
	/**
	 * @param model 모델
	 * @return 건강정보 등록 페이지
	 */
	@RequestMapping(value="/add.write", method = RequestMethod.GET)
	public String addForm(final Model model, final SearchPaggingCommonPO param){
		
		model.addAttribute("defaultInfo", service.getAddNoticeDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/board/payrollNotice/add";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 */
	@RequestMapping(value="/addPayrollNotice.write",method = RequestMethod.POST)
	public String addNotice(final PayrollNoticeAddPO param, @RequestParam("files") final MultipartFile[] files, final Model model, final HttpServletRequest req) throws IOException{

		model.addAttribute("result", service.addPayrollNotice(param, files, req));
		
		return "jsonView";
	}
	

	/**
	 * @param seq 급여 고시  seq
	 * @param model
	 * @return
	 * @throws IOException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value="/{seq}.edit", method=RequestMethod.GET)
	public String editForm(@PathVariable("seq") final String seq,final SearchPaggingCommonPO param, final Model model) throws NumberFormatException, IOException{
		
		if(StringUtils.isEmpty(seq) || !StringUtils.isNumeric(seq)){
			throw new NullPointerException(seq);
		}
		
		
		PayrollNoticeViewRO notice = service.findPayrollNoticeInfo(Integer.valueOf(seq));
		
		notice.setContent(notice.getContent().replaceAll("&nbsp;", " "));
		
		model.addAttribute("result", notice);
		model.addAttribute("defaultInfo", service.getAddNoticeDefaultInfo());
		model.addAttribute("sparam", param);

		return "/admin/board/payrollNotice/edit";
	}
	
	/**
	 * @param param 등록 정보
	 * @param model 모델
	 * @param req req
	 * @return 등록 결과 메뉴 seq
	 * @throws IOException 
	 */
	@RequestMapping(value="/editPayrollNotice.edit",method = RequestMethod.POST)
	public String editNotice(final PayrollNoticeEditPO param, @RequestParam("files") final MultipartFile[] files, final Model model, final HttpServletRequest req) throws IOException{

		model.addAttribute("result", service.editPayrollNotice(param, files, req));

		return "jsonView";
	}
	
	
	/**
	 * @param seq 급여 고시  seq
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
		
		boolean result = service.deletePayrollNotice(Integer.valueOf(seq), req);
		model.addAttribute("result", result);
		
		return "jsonView";
	}

}
