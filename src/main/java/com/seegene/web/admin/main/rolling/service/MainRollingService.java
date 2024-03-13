package com.seegene.web.admin.main.rolling.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.main.rolling.vo.MainRollingAddDefaultRO;
import com.seegene.web.admin.main.rolling.vo.MainRollingAddPO;
import com.seegene.web.admin.main.rolling.vo.MainRollingEditDefaultRO;
import com.seegene.web.admin.main.rolling.vo.MainRollingEditPO;
import com.seegene.web.admin.main.rolling.vo.MainRollingListRO;
import com.seegene.web.admin.main.rolling.vo.MainRollingVO;
import com.seegene.web.admin.main.rolling.vo.MainRollingViewRO;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MainRollingMapper;

/**
 * 롤링 서비스
 */
@Service
@Transactional
public class MainRollingService {
	
	@Autowired
	private MainRollingMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	/**
	 * @param seq 롤링 seq
	 * @return 로그용 롤링 정보
	 */
	private MainRollingVO findRollingBySeq(final int seq){
		return mapper.findRollingBySeq(seq);
	}
	

	/**
	 * @param param 검색 조건
	 * @return 결과
	 */
	public CommonListReuslt<MainRollingListRO> findRollingList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<MainRollingListRO> list = mapper.findRollingList(param);
		int count = mapper.countRollingList(param);
		
		CommonListReuslt<MainRollingListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
		
	}


	/**
	 * @param seq 롤링 seq
	 * @return 롤링 상세 정보
	 */
	public MainRollingViewRO findRollingInfo(final int seq) {
		
		return mapper.findRollingViewBySeq(seq);
	}

	
	/**
	 * @return 롤링 등록시 사용할 기본 정보
	 */
	public MainRollingAddDefaultRO getAddRollingDefaultInfo() {
		
		MainRollingAddDefaultRO item = new MainRollingAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		
		return item;
	}

	/**
	 * @param order 기준 순서
	 * @param codeLang 언어코드
	 * @param incFlag 증감 플래그
	 * @param req req
	 */
	private void updateRollingOrder( final int order, final String codeLang, final boolean incFlag, final HttpServletRequest req){
		
		MainRollingVO item = new MainRollingVO();
		item.setPrintOrder(order);
		item.setCodeLangType(codeLang);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<MainRollingVO> beforeData = mapper.checkRollingOrder(item);
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateRollingOrderInc(item);
			}else{
				mapper.updateRollingOrderDec(item);
			}
			
			List<MainRollingVO> afterData = mapper.checkRollingOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
		
	}
	
	/**
	 * @param seq 롤링 seq
	 * @param req req
	 * @return 삭제 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deleteRolling(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		MainRollingVO beforeData = this.findRollingBySeq(seq);
		
		if(beforeData.getDeleteFlag().equals("Y")){
			return true;
		}
		
		MainRollingVO item = new MainRollingVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteRolling(item);
		
		MainRollingVO afterData = this.findRollingBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		//롤링 순서 업데이트
		updateRollingOrder(beforeData.getPrintOrder() , beforeData.getCodeLangType(), false, req);
		adminUtilService.reloadServer();
		return true;
	}


	/**
	 * @param langCode 언어코드
	 * @return 언어별 출력중인 수
	 */
	public int getPrintOrder(final String langCode) {
		return mapper.getPrintOrder(langCode);
	}


	/**
	 * @param param 롤링 등록 정보
	 * @param req req
	 * @return 등록된 롤링 seq
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public int addRolling(final MainRollingAddPO param, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		
		//롤링 순서 조정
		updateRollingOrder(param.getPrintOrder() , param.getCodeLang(), true, req);
		
		MainRollingVO item = new MainRollingVO();
		
		item.setCodeLangType(param.getCodeLang());
		item.setContent(param.getContent());
		item.setUrl(param.getUrl());
		item.setPrintFlag(param.getPrintFlag());
		item.setPrintOrder(param.getPrintOrder());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addRolling(item);
		
		MainRollingVO afterData = this.findRollingBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		adminUtilService.reloadServer();
		return item.getSeq();
	}


	/**
	 * @param langCode 언어코드
	 * @return 수정시 필요한 기본 정보
	 */
	public MainRollingEditDefaultRO getEditRecruitDefaultInfo(final String langCode) {
		
		MainRollingEditDefaultRO item = new MainRollingEditDefaultRO();
		
		item.setLangCodes(codeService.findLangCode());
		item.setMaxCount(this.getPrintOrder(langCode));
		
		return item;
	}


	/**
	 * @param param 수정 파라미터
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean editRolling(final MainRollingEditPO param, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		MainRollingVO beforeData = this.findRollingBySeq(param.getSeq());
		
		if(beforeData.getPrintOrder() != param.getPrintOrder() || beforeData.getCodeLangType() != param.getCodeLang()){
			updateRollingOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), false, req);
			updateRollingOrder(param.getPrintOrder(), param.getCodeLang(), true, req);
		}
		
		MainRollingVO item = new MainRollingVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setContent(param.getContent());
		item.setUrl(param.getUrl());
		item.setPrintFlag(param.getPrintFlag());
		item.setPrintOrder(param.getPrintOrder());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editRolling(item);
		
		MainRollingVO afterData = this.findRollingBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		adminUtilService.reloadServer();
		return true;
	}


}
