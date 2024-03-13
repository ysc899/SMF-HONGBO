package com.seegene.web.admin.board.manage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.board.manage.vo.BoardDefaultMasterVO;
import com.seegene.web.admin.board.manage.vo.BoardManageAddDefaultRO;
import com.seegene.web.admin.board.manage.vo.BoardManageAddPO;
import com.seegene.web.admin.board.manage.vo.BoardManageEditPO;
import com.seegene.web.admin.board.manage.vo.BoardManageListRO;
import com.seegene.web.admin.board.manage.vo.BoardManageViewRO;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.menu.admin.service.MenuAdminService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.BoardManageMapper;

@Service
@Transactional
public class BoardManageService {
	
	@Autowired
	private BoardManageMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private MenuAdminService menuAdminService;
	
	/**
	 * @param seq 식별자
	 * @return 로그용 보드 마스터 정보
	 */
	private BoardDefaultMasterVO findBoardMasterBySeq(final int seq){
		return mapper.findBoardManageMasterBySeq(seq);
	}

	/**
	 * @param param 검색 조건
	 * @return 통합 게시판 관리 리스트
	 */
	public CommonListReuslt<BoardManageListRO> findBoardManageList(SearchPaggingCommonPO param) {
 		param.setMybatisPagging();
		List<BoardManageListRO> list = mapper.findBoardManageList(param);
		int count = mapper.countBoardManageList(param);
		
		CommonListReuslt<BoardManageListRO> result = new CommonListReuslt<>(list, count, param);
		return result;
	}

	/**
	 * @param seq 통합 faq seq
	 * @return 통합 faq 정보
	 */
	public BoardManageViewRO findBoardManageInfo(final int seq) {
		
		return mapper.findBoardManageViewBySeq(seq);
	}

	/**
	 * @return 동적 게시판 등록시 기본정보
	 */
	public BoardManageAddDefaultRO getAddBoardManageDefaultInfo() {
		BoardManageAddDefaultRO item = new BoardManageAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		return item;
	}

	/**
	 * @param param 등록 정보
	 * @param req req
	 * @return 통합 게시판 seq
	 */
	public int addBoardManage(final BoardManageAddPO param, final HttpServletRequest req) {
		
		BoardDefaultMasterVO item = new BoardDefaultMasterVO();
		item.setMasterName(param.getName());
		item.setMasterDesc(param.getDesc());
		item.setCodeLangType(param.getCodeLang());
		item.setOptThumFlag(param.getOptThum());
		item.setOptFileFlag(param.getOptFile());
		item.setOptNotiFlag(param.getOptNoti());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addBoardManage(item);
		
		
		BoardDefaultMasterVO afterData = this.findBoardMasterBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		
		//관리자 메뉴 등록
		menuAdminService.addBoardNFaqMenu(param.getName(), item.getSeq(), req);
		
		return item.getSeq();
	}
	
	public boolean editBoardManage(final BoardManageEditPO param, final HttpServletRequest req) {
		
		BoardDefaultMasterVO beforeData = this.findBoardMasterBySeq(param.getSeq());
		
		BoardDefaultMasterVO item = new BoardDefaultMasterVO();
		item.setSeq(param.getSeq());
		item.setEditUserId(SessionUtil.getAuthUserId());
		item.setMasterName(param.getName());
		item.setMasterDesc(param.getDesc());
		item.setCodeLangType(param.getCodeLang());
		item.setOptThumFlag(param.getOptThum());
		item.setOptFileFlag(param.getOptFile());
		item.setOptNotiFlag(param.getOptNoti());
		
		mapper.editBoardManage(item);
		
		BoardDefaultMasterVO afterData = this.findBoardMasterBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

	/**
	 * @param seq 식별자
	 * @param req req
	 * @return 삭제 성공 여부
	 */
	public boolean deleteBoardManage(final int seq, final HttpServletRequest req) {
		
		BoardDefaultMasterVO beforeData = this.findBoardMasterBySeq(seq);
		
		BoardDefaultMasterVO item = new BoardDefaultMasterVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteBoardManage(item);
		
		BoardDefaultMasterVO afterData = this.findBoardMasterBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

}
