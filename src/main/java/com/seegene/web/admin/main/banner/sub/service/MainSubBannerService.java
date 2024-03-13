package com.seegene.web.admin.main.banner.sub.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerAddDefaultRO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerAddPO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerEditDefaultRO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerEditPO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerListRO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerVO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerViewRO;
import com.seegene.web.admin.main.banner.sub.vo.MainUserBannerSubListRO;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MainBannerSubMapper;

/**
 * 롤링 서비스
 */
@Service
@Transactional
public class MainSubBannerService {
	
	@Autowired
	private MainBannerSubMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	private final String FILE_PATH = "mainSubBanner";
	
	/**
	 * @param seq 롤링 seq
	 * @return 로그용 롤링 정보
	 */
	private MainSubBannerVO findSubBannerBySeq(final int seq){
		return mapper.findSubBannerBySeq(seq);
	}
	

	/**
	 * @param param 검색 조건
	 * @return 결과
	 */
	public CommonListReuslt<MainSubBannerListRO> findSubBannerList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<MainSubBannerListRO> list = mapper.findSubBannerList(param);
		int count = mapper.countSubBannerList(param);
		
		CommonListReuslt<MainSubBannerListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
		
	}


	/**
	 * @param seq 롤링 seq
	 * @return 롤링 상세 정보
	 * @throws IOException 
	 */
	public MainSubBannerViewRO findSubBannerInfo(final int seq) throws IOException {
		
		MainSubBannerViewRO result = mapper.findSubBannerViewBySeq(seq);
		
		result.setFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getFilePath()));
		return result; 
	}

	
	/**
	 * @return 롤링 등록시 사용할 기본 정보
	 */
	public MainSubBannerAddDefaultRO getAddSubBannerDefaultInfo() {
		
		MainSubBannerAddDefaultRO item = new MainSubBannerAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		
		return item;
	}
//
	/**
	 * @param order 기준 순서
	 * @param codeLang 언어코드
	 * @param incFlag 증감 플래그
	 * @param req req
	 */
	private void updateSubBannerOrder( final int order, final String codeLang, final boolean incFlag, final HttpServletRequest req){
		
		MainSubBannerVO item = new MainSubBannerVO();
		item.setPrintOrder(order);
		item.setCodeLangType(codeLang);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<MainSubBannerVO> beforeData = mapper.checkSubBannerOrder(item);
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateSubBannerOrderInc(item);
			}else{
				mapper.updateSubBannerOrderDec(item);
			}
			
			List<MainSubBannerVO> afterData = mapper.checkSubBannerOrder(item);
			
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
	public boolean deleteSubBanner(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		MainSubBannerVO beforeData = this.findSubBannerBySeq(seq);
		
		if(beforeData.getDeleteFlag().equals("Y")){
			return true;
		}
		
		MainSubBannerVO item = new MainSubBannerVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteSubBanner(item);
		
		MainSubBannerVO afterData = this.findSubBannerBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		//롤링 순서 업데이트
		updateSubBannerOrder(beforeData.getPrintOrder() , beforeData.getCodeLangType(), false, req);
		
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
	 * @param langCode 언어코드
	 * @return 수정시 필요한 기본 정보
	 */
	public MainSubBannerEditDefaultRO getEditSubBannerDefaultInfo(final String langCode) {
		
		MainSubBannerEditDefaultRO item = new MainSubBannerEditDefaultRO();
		
		item.setLangCodes(codeService.findLangCode());
		item.setMaxCount(this.getPrintOrder(langCode));
		
		return item;
	}


	/**
	 * @param param 수정 파라미터
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws InterruptedException 
	 * @throws IOException 
	 */
	public boolean editSubBanner(final MainSubBannerEditPO param,final MultipartFile[] files, final HttpServletRequest req) throws IOException, InterruptedException {
		
		MainSubBannerVO beforeData = this.findSubBannerBySeq(param.getSeq());
		
		if(beforeData.getPrintOrder() != param.getPrintOrder() || beforeData.getCodeLangType() != param.getCodeLang()){
			updateSubBannerOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), false, req);
			updateSubBannerOrder(param.getPrintOrder(), param.getCodeLang(), true, req);
		}
		
		MainSubBannerVO item = new MainSubBannerVO();
		item.setSeq(param.getSeq());
		item.setTitle(param.getTitle());
		if(files.length > 0){
			item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, files[0], 170, 130));
		}else{
			item.setFilePath(beforeData.getFilePath());
		}
		
		item.setCodeLangType(param.getCodeLang());
		item.setContent(param.getContent());
		item.setUrl(param.getUrl());
		item.setPrintFlag(param.getPrintFlag());
		item.setPrintOrder(param.getPrintOrder());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editSubBanner(item);
		
		MainSubBannerVO afterData = this.findSubBannerBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		adminUtilService.reloadServer();

		return true;
	}


	public int addSubBanner(final MainSubBannerAddPO param, final  MultipartFile file, final HttpServletRequest req) throws IOException, InterruptedException {
		//롤링 순서 조정
		updateSubBannerOrder(param.getPrintOrder() , param.getCodeLang(), true, req);
		
		MainSubBannerVO item = new MainSubBannerVO();
		
		item.setCodeLangType(param.getCodeLang());
		item.setTitle(param.getTitle());
		item.setContent(param.getContent());
		item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file, 170, 130));
		item.setUrl(param.getUrl());
		item.setPrintFlag(param.getPrintFlag());
		item.setPrintOrder(param.getPrintOrder());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addSubBanner(item);
		
		MainSubBannerVO afterData = this.findSubBannerBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		
		adminUtilService.reloadServer();
		return item.getSeq();
	}
	
	public List<MainUserBannerSubListRO> findUserSubBannerList(){
		
		List<MainUserBannerSubListRO> result = mapper.userSubBannerList();
		result.forEach(t ->{
			try {
				t.setFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + t.getFilePath()));
			} catch (IOException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
			}
		});
		
		return result;
	}

}
