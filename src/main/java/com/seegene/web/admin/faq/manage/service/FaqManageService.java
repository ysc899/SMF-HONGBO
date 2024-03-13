package com.seegene.web.admin.faq.manage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.faq.manage.vo.BoardFaQMasterVO;
import com.seegene.web.admin.faq.manage.vo.FaqManageAddDefaultRO;
import com.seegene.web.admin.faq.manage.vo.FaqManageAddPO;
import com.seegene.web.admin.faq.manage.vo.FaqManageEditPO;
import com.seegene.web.admin.faq.manage.vo.FaqManageListRO;
import com.seegene.web.admin.faq.manage.vo.FaqManageViewRO;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.menu.admin.service.MenuAdminService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.FaqManageMapper;

@Service
@Transactional
public class FaqManageService {
	
	@Autowired
	private FaqManageMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private MenuAdminService menuAdminService;

	/**
	 * @param param 검색조건
	 * @return 통합 FAQ 관리 리스트
	 */
	public CommonListReuslt<FaqManageListRO> findFaqManageList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<FaqManageListRO> list = mapper.findFaqManageList(param);
		int count = mapper.countFaqManageList(param);
		
		CommonListReuslt<FaqManageListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 통합 faq seq
	 * @return 통합 faq 정보
	 */
	public FaqManageViewRO findFaqManageInfo(final int seq) {
		
		return mapper.findFaqManageViewBySeq(seq);
	}

	/**
	 * @return 통합 FAQ 등록용 기본 정보
	 */
	public FaqManageAddDefaultRO getAddFaqManageDefaultInfo() {
		FaqManageAddDefaultRO item = new FaqManageAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		
		return item;
	}

	/**
	 * @param param 통합faq 등록 정보
	 * @param req req
	 * @return 등록된 seq
	 */
	public int addFaqManage(final FaqManageAddPO param, final HttpServletRequest req) {
		
		BoardFaQMasterVO item = new BoardFaQMasterVO();
		item.setCodeLangType(param.getCodeLang());
		item.setMasterName(param.getName());
		item.setMasterDesc(param.getDesc());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addFaqManage(item);
		
		BoardFaQMasterVO afterData = mapper.findFaqManageMasterBySeq(item.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		
		//관리자 메뉴 등록
		menuAdminService.addBoardNFaqMenu(param.getName(), item.getSeq(), req);
		
		return item.getSeq();
	}

	/**
	 * @param param 수정된 정보
	 * @param req req
	 * @return 성공 여부
	 */
	public boolean editFaqManage(final FaqManageEditPO param, final HttpServletRequest req) {
		BoardFaQMasterVO beforeData = mapper.findFaqManageMasterBySeq(param.getSeq());
		
		BoardFaQMasterVO item = new BoardFaQMasterVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setMasterName(param.getName());
		item.setMasterDesc(param.getDesc());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editFaqManage(item);
		
		BoardFaQMasterVO afterData = mapper.findFaqManageMasterBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

	/**
	 * @param seq 삭제될 faq
	 * @param req req
	 * @return 삭제 성공 여부
	 */
	public boolean deleteFaqManage(final int seq, final HttpServletRequest req) {
		
		BoardFaQMasterVO beforeData = mapper.findFaqManageMasterBySeq(seq);
		
		BoardFaQMasterVO item = new BoardFaQMasterVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteFaqManage(item);
		
		BoardFaQMasterVO afterData = mapper.findFaqManageMasterBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}
	
}

