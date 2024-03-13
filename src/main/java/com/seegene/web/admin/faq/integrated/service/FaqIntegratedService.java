package com.seegene.web.admin.faq.integrated.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.faq.integrated.vo.BoardFaQSlaveVO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedAddDefaultRO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedAddPO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedEditPO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedResultRO;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.menu.admin.service.MenuAdminService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.common.StringUtil;
import com.seegene.web.repository.mariadb.FaqIntegratedMapper;

@Service
@Transactional
public class FaqIntegratedService {
	
	@Autowired
	private FaqIntegratedMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	
	/**
	 * @param masterSeq 마스터 seq
	 * @param seq 내용 seq
	 * @return 결과
	 */
	private BoardFaQSlaveVO findSlaveBySeqs(final int masterSeq, final int seq){
		
		BoardFaQSlaveVO param = new BoardFaQSlaveVO();
		param.setBoardFaqMasterSeq(masterSeq);
		param.setSeq(seq);
				
		
		return mapper.findFaqSlaveBySeq(param);
	}

	/**
	 * @param masterSeq 마스터 faq seq
	 * @param param 검색조건
	 * @return 통합 FAQ 관리 리스트
	 * @throws Exception 
	 */
	public CommonListReuslt<FaqIntegratedResultRO> findFaqIntegratedList(final int masterSeq, final SearchIntegrateSearchPaggingPO param) throws Exception {
		param.setMasterSeq(masterSeq);
		param.setMybatisPagging();
		List<FaqIntegratedResultRO> list = mapper.findFaqIntegratedList(param);
		
		for(FaqIntegratedResultRO item : list){
		 	item.setQuestion(StringUtil.removeHtmlTag(item.getQuestion()));
		 	item.setAnswer(StringUtil.removeHtmlTag(item.getAnswer()));
		}
		
		
		int count = mapper.countFaqIntegratedList(param);
		
		CommonListReuslt<FaqIntegratedResultRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param masterSeq 통합 fAQ seq
	 * @param seq 내용 seq
	 * @return 정보
	 */
	public FaqIntegratedResultRO findFaqIntegratedView(final int masterSeq, final int seq) {
	
		BoardFaQSlaveVO item = new BoardFaQSlaveVO();
		item.setBoardFaqMasterSeq(masterSeq);
		item.setSeq(seq);
		
		FaqIntegratedResultRO result = mapper.findFaqIntegratedViewBySeq(item);
		
		result.setQuestion(StringUtil.removeEnter(result.getQuestion()));
		result.setAnswer(StringUtil.removeEnter(result.getAnswer()));
		
		return result;
	}

	/**
	 * 
	 * @param masterSeq 마스터 faq seq
	 * @param seq 내용 seq
	 * @param req req
	 * @return 삭제 성공 여부
	 */
	public boolean deleteFaqIntegrated(final int masterSeq, final int seq, final HttpServletRequest req) {
		
		BoardFaQSlaveVO beforeData = this.findSlaveBySeqs(masterSeq, seq);
		
		BoardFaQSlaveVO item = new BoardFaQSlaveVO();
		item.setBoardFaqMasterSeq(masterSeq);
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteFaqIntegrated(item);
		
		BoardFaQSlaveVO afterData = this.findSlaveBySeqs(masterSeq, seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

	/**
	 * @return faq 내용 등록시 사용할 기본 정보들
	 */
	public FaqIntegratedAddDefaultRO getAddFaqIntegratedDefaultInfo() {
		
		FaqIntegratedAddDefaultRO item = new FaqIntegratedAddDefaultRO();
		item.setCategoryCodes(codeService.findSlaveByMaster("FAQ"));
		
		return item;
	}

	/**
	 * @param masterSeq 부모 seq
	 * @param param 등록 정보
	 * @param req req
	 * @return 등록된 내용 seq
	 */
	public int addFaqIntegrated( final int masterSeq, final FaqIntegratedAddPO param, final HttpServletRequest req) {
		BoardFaQSlaveVO item = new BoardFaQSlaveVO();
		item.setBoardFaqMasterSeq(masterSeq);
		item.setQuestion(param.getQuestion());
		item.setAnswer(param.getAnswer());
		item.setCodeCategoryType(param.getCodeCategory());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addFaqIntegrated(item);
		
		BoardFaQSlaveVO afterData = this.findSlaveBySeqs(masterSeq, item.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		
		return item.getSeq();
	}

	/**
	 * @param masterSeq 부모 seq
	 * @param param 수정 정보
	 * @param req req
	 * @return 수정 성고 ㅇ여부
	 */
	public boolean editFaqIntegrated(final int masterSeq, final FaqIntegratedEditPO param, final HttpServletRequest req) {
		
		BoardFaQSlaveVO beforeData = this.findSlaveBySeqs(masterSeq, param.getSeq());
		
		BoardFaQSlaveVO item = new BoardFaQSlaveVO();
		item.setSeq(param.getSeq());
		item.setBoardFaqMasterSeq(masterSeq);
		item.setQuestion(param.getQuestion());
		item.setAnswer(param.getAnswer());
		item.setCodeCategoryType(param.getCodeCategory());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		
		mapper.editFaqIntegrated(item);
		
		BoardFaQSlaveVO afterData = this.findSlaveBySeqs(masterSeq, param.getSeq());
		
		logEditService.insertEditLog(req,beforeData, afterData);
		
		return true;
	}

}

