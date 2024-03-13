package com.seegene.web.user.customer.payrollNotice.service;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.seegene.web.admin.board.payrollNotice.vo.PayrollFileDownPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileVO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileViewRO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.PayrollNoticeMapper;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.customer.notice.vo.NoticeListRO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollDefaultRO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollListRO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollSearchPO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollViewNextPreRO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollViewRO;



@Service
public class PayrollService {

	@Autowired
	private PayrollNoticeMapper mapper;
	
	@Autowired
	private UserCodeService userCodeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	/** 공문 파일 경로 */
	private final String FILE_PATH = "payrollNotice";
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public PayrollDefaultRO getDefaultData(final String langCode){
		
		PayrollDefaultRO item = new PayrollDefaultRO();
		item.setCenterCodes(userCodeService.findCodeList("center", langCode));
		
		return item;
	}

	/**
	 * @param param 검색조건
	 * @param locale 언어코드
	 * @return
	 */
	public CommonListReuslt<PayrollListRO> findPayrollNoticeList(final PayrollSearchPO param, final Locale locale) {
		/*PayrollNoticeSearchPO
		PayrollNoticeListRO*/
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		
		List<PayrollListRO> content = mapper.findUserPayrollNoticeList(param);
		
		int count = mapper.countUserPayrollNoticeList(param);
		
		content.forEach(t ->{
			t.setRow(count - t.getRow() + 1);
		});
		
		CommonListReuslt<PayrollListRO> result = new CommonListReuslt<>(content, count, param);
		
		return result;
	}
	
	/**
	 * @param param 검색조건
	 * @param locale 언어코드
	 * @return
	 */
	public List<PayrollListRO> getPayrollNoticeList(final Locale locale) {
		
		List<PayrollListRO> content = mapper.getUserPayrollNoticeList(locale.getLanguage());
		
		return content;
	}

	public PayrollViewRO findPayrollNoticeInfo(final int seq, final String language) {
		
		PayrollNoticeVO viewParam = new PayrollNoticeVO();
		viewParam.setSeq(seq);
		viewParam.setCodeLangType(language);
		
		PayrollViewRO result = mapper.findUserPayrollNoticeViewBySeq(viewParam);
		
		if(result != null){
		
			result.setContent(result.getContent().replaceAll("&nbsp;", " "));
			
			mapper.updatePayrollNoticeHit(seq);
			List<PayrollNoticeFileViewRO> files = mapper.findPayrollNoticeFileViewByNoticeSeq(seq);
			result.setFiles(files);
			
			List<PayrollViewNextPreRO> nextPre = mapper.findPayrollNoticeNextPreBySeq(viewParam);
			
			PayrollViewNextPreRO pre = nextPre.stream().filter(t ->{return t.getType().equals("pre");}).findFirst().orElse(null);
			if(pre == null){
				pre = new PayrollViewNextPreRO();
				pre.setSeq(0);
			}
			result.setPreNotice(pre);
			
			PayrollViewNextPreRO next = nextPre.stream().filter(t ->{return t.getType().equals("next");}).findFirst().orElse(null);
			if(next == null){
				next = new PayrollViewNextPreRO();
				next.setSeq(0);
			}
			result.setNextNotice(next);
		}
		
		return result;
	}
	
	public void findNoticeThum(final int seq, final String language,  final HttpServletRequest request, final HttpServletResponse response ) {
		
		PayrollNoticeVO viewParam = new PayrollNoticeVO();
		viewParam.setSeq(seq);
		viewParam.setCodeLangType(language);
		
		PayrollViewRO result = mapper.findUserPayrollNoticeViewBySeq(viewParam);
		
		if(result != null){
			
			Document doc = Jsoup.parse(result.getContent());
			Elements imgs = doc.getElementsByTag("img");
			
			if (imgs.size() > 0) {
				Element img = imgs.get(0);
				String imgData = img.attr("src");
				fileComponent.streamImageString(imgData, request, response);
			}
		}
			
	}

	public void downloadPayrollNoticeFile(final int seq, final int fileSeq, final HttpServletRequest request, final HttpServletResponse response) {
		PayrollFileDownPO item = new PayrollFileDownPO();
		item.setPayrollNoticeSeq(seq);
		item.setPayrollNoticeFileSeq(fileSeq);
		
		PayrollNoticeFileVO fileVO = mapper.findPayrollNoticeFile(item);
		
		if(fileVO == null){
			return;
		}
		
		System.out.println("FILE_PATH####"+ FILE_PATH);
		System.out.println("fileVO.getFilePath()####"+ fileVO.getFilePath());
		System.out.println("fileVO.getFileName()####"+ fileVO.getFileName());
		
		mapper.updatePayrollNoticeFileHit(item);
		
		fileComponent.downloadFile(FILE_PATH, fileVO.getFilePath(), fileVO.getFileName(), request, response);
		
	}
	
	public List<PayrollListRO> findMainNoticeListContent(final String lang){
		PayrollSearchPO param = new PayrollSearchPO();
		param.setCodeLangType(lang);
		param.setLimit(6);
		param.setMybatisPagging();
	
		return mapper.findUserPayrollNoticeList(param);
		
	}
}
