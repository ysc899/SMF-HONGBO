package com.seegene.web.admin.status.history.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.status.certification.vo.CertificationVO;
import com.seegene.web.admin.status.history.vo.HistoryAddDefaultRO;
import com.seegene.web.admin.status.history.vo.HistoryAddPO;
import com.seegene.web.admin.status.history.vo.HistoryEditDefaultRO;
import com.seegene.web.admin.status.history.vo.HistoryEditPO;
import com.seegene.web.admin.status.history.vo.HistoryListRO;
import com.seegene.web.admin.status.history.vo.HistoryVO;
import com.seegene.web.admin.status.history.vo.HistoryViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.HistoryMapper;

@Service
@Transactional
public class HistoryService {
	
	@Autowired
	private HistoryMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	private HistoryVO findHistoryBySeq(final int seq){
		return mapper.findHistoryBySeq(seq);
	}

	public CommonListReuslt<HistoryListRO> findHistoryList(final SearchPaggingCommonPO param) {
		param.setMybatisPagging();
		List<HistoryListRO> list = mapper.findHistoryList(param);
		int count = mapper.countHistoryList(param);
		
		CommonListReuslt<HistoryListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 식별자
	 * @return 연혁정보
	 */
	public HistoryViewRO findHistoryInfo(final int seq) {
		
		HistoryViewRO history = mapper.findHistoryViewBySeq(seq);
		return history;
	}

	/**
	 * @return 연혁 등록 기본 정보
	 */
	public HistoryAddDefaultRO getAddHistoryDefaultInfo() {
		HistoryAddDefaultRO item = new HistoryAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		
		return item;
	}

	/**
	 * @param lang 언어코드
	 * @param date 년월
	 * @return
	 */
	public int maxPrintOrder(final String lang, final String date) {
		
		Date selectDate = DateUtil.getDate(date, "yyyy-MM");
		String year = DateUtil.getFormatString(selectDate, "yyyy");
		String month = DateUtil.getFormatString(selectDate, "MM");

		
		HistoryVO item = new HistoryVO();
		item.setYear(year);
		item.setMonth(month);
		item.setCodeLangType(lang);
		
		
		return mapper.getPrintOrder(item);
	}
	
	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateHistoryOrder(final int printOrder, final String langCode, final String year, final String month,  final boolean incFlag, final HttpServletRequest req){
		
		HistoryVO item = new HistoryVO();
		item.setPrintOrder(printOrder);
		item.setCodeLangType(langCode);
		item.setYear(year);
		item.setMonth(month);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<HistoryVO> beforeData = mapper.checkHistoryOrder(item);
		
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateHistoryOrderInc(item);
			}else{
				mapper.updateHistoryOrderDec(item);
			}
			
			List<HistoryVO> afterData = mapper.checkHistoryOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
	}

	/**
	 * @param param 등록 파라미터
	 * @param req req
	 * @return seq
	 */
	public int addHistory(final HistoryAddPO param, final HttpServletRequest req) {
		Date selectDate = DateUtil.getDate(param.getSelectDate(), "yyyy-MM");
		String year = DateUtil.getFormatString(selectDate, "yyyy");
		String month = DateUtil.getFormatString(selectDate, "MM");

		
		HistoryVO item = new HistoryVO();
		item.setYear(year);
		item.setMonth(month);
		item.setCodeLangType(param.getCodeLang());
		item.setContent(param.getContent());
		item.setPrintOrder(param.getPrintOrder());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		this.updateHistoryOrder(item.getPrintOrder(), item.getCodeLangType(),year, month, true, req);
		
		item.setRegUserId(SessionUtil.getAuthUserId());
		/*HistoryVO(seq=0
					, year=2020
					, month=09
					, endYear=null
					, codeLangType=ko
					, content=test11
					, printOrder=1
					, regDate=null
					, regUserId=system
					, editDate=null
					, editUserId=null
					, deleteFlag=null
		)*/
		
		mapper.addHistory(item);
		
		HistoryVO afterData = this.findHistoryBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		
		
		return item.getSeq();
	}

	/**
	 * @param seq 삭제될 seq
	 * @param req req
	 * @return 상세 성공 여부
	 */
	public boolean deleteHistory(final int seq, final HttpServletRequest req) {
		
		HistoryVO beforeData = this.findHistoryBySeq(seq);
		
		HistoryVO item = new HistoryVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteHistory(item);
		
		HistoryVO afterData = this.findHistoryBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		this.updateHistoryOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), beforeData.getYear(), beforeData.getMonth(), false, req);
		
		return true;
	}

	/**
	 * @param history 연혁 정보
	 * @return 수정시 사용할 파라미터 값
	 */
	public HistoryEditDefaultRO getEditHistoryDefaultInfo(final HistoryViewRO history) {
		HistoryEditDefaultRO item = new HistoryEditDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setMaxOrder(this.maxPrintOrder(history.getCodeLangType(), history.getYear()+"-"+history.getMonth()));

		return item;
	}

	public boolean editHistory(final HistoryEditPO param, final HttpServletRequest req) {
		
		Date selectDate = DateUtil.getDate(param.getSelectDate(), "yyyy-MM");
		String year = DateUtil.getFormatString(selectDate, "yyyy");
		String month = DateUtil.getFormatString(selectDate, "MM");
		
		HistoryVO beforeData = this.findHistoryBySeq(param.getSeq());
		
		if(!beforeData.getCodeLangType().equals(param.getCodeLang()) 
			|| beforeData.getPrintOrder() != param.getPrintOrder() 
			|| !beforeData.getYear().equals(year) 
			|| !beforeData.getMonth().equals(month)){
			//언어 코드가 변경 되거나 출력 순서가 변경된 경우
			this.updateHistoryOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), beforeData.getYear(), beforeData.getMonth(), false, req);
			this.updateHistoryOrder(param.getPrintOrder(), param.getCodeLang(), year, month, true, req);
		}
		HistoryVO item = new HistoryVO();
		item.setSeq(param.getSeq());
		item.setYear(year);
		item.setMonth(month);
		item.setCodeLangType(param.getCodeLang());
		item.setContent(param.getContent());
		item.setPrintOrder(param.getPrintOrder());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editHistory(item);
		
		HistoryVO afterData = this.findHistoryBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);

		
		return true;
	}

}
