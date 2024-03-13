package com.seegene.web.admin.main.banner.main.service;

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
import com.seegene.web.admin.main.banner.main.vo.MainBannerAddDefaultRO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerAddPO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerEditDefaultRO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerEditPO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerListRO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerVO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerViewRO;
import com.seegene.web.admin.main.banner.main.vo.MainUserBannerListRO;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MainBannerMapper;

/**
 * 롤링 서비스
 */
@Service
@Transactional
public class MainBannerService {
	
	@Autowired
	private MainBannerMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	public static final String FILE_PATH = "mainBanner";
	
	/**
	 * @param seq 롤링 seq
	 * @return 로그용 롤링 정보
	 */
	private MainBannerVO findBannerBySeq(final int seq){
		return mapper.findBannerBySeq(seq);
	}
	

	/**
	 * @param param 검색 조건
	 * @return 결과
	 */
	public CommonListReuslt<MainBannerListRO> findBannerList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<MainBannerListRO> list = mapper.findBannerList(param);
		int count = mapper.countBannerList(param);
		
		CommonListReuslt<MainBannerListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
		
	}


	/**
	 * @param seq 롤링 seq
	 * @return 롤링 상세 정보
	 * @throws IOException 
	 */
	public MainBannerViewRO findBannerInfo(final int seq) throws IOException {
		
		MainBannerViewRO result = mapper.findBannerViewBySeq(seq);
		
		result.setFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getFilePath()));
		return result; 
	}

	
	/**
	 * @return 롤링 등록시 사용할 기본 정보
	 */
	public MainBannerAddDefaultRO getAddBannerDefaultInfo() {
		
		MainBannerAddDefaultRO item = new MainBannerAddDefaultRO();
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
	private void updateBannerOrder( final int order, final String codeLang, final boolean incFlag, final HttpServletRequest req){
		
		MainBannerVO item = new MainBannerVO();
		item.setPrintOrder(order);
		item.setCodeLangType(codeLang);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<MainBannerVO> beforeData = mapper.checkBannerOrder(item);
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateBannerOrderInc(item);
			}else{
				mapper.updateBannerOrderDec(item);
			}
			
			List<MainBannerVO> afterData = mapper.checkBannerOrder(item);
			
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
	public boolean deleteBanner(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		MainBannerVO beforeData = this.findBannerBySeq(seq);
		
		if(beforeData.getDeleteFlag().equals("Y")){
			return true;
		}
		
		MainBannerVO item = new MainBannerVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteBanner(item);
		
		MainBannerVO afterData = this.findBannerBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		//롤링 순서 업데이트
		updateBannerOrder(beforeData.getPrintOrder() , beforeData.getCodeLangType(), false, req);
		
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
	public MainBannerEditDefaultRO getEditBannerDefaultInfo(final String langCode) {
		
		MainBannerEditDefaultRO item = new MainBannerEditDefaultRO();
		
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
	public boolean editBanner(final MainBannerEditPO param,final MultipartFile[] files, final HttpServletRequest req) throws IOException, InterruptedException {
		
		MainBannerVO beforeData = this.findBannerBySeq(param.getSeq());
		
		if(beforeData.getPrintOrder() != param.getPrintOrder() || beforeData.getCodeLangType() != param.getCodeLang()){
			updateBannerOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), false, req);
			updateBannerOrder(param.getPrintOrder(), param.getCodeLang(), true, req);
		}
		
		MainBannerVO item = new MainBannerVO();
		item.setSeq(param.getSeq());
		item.setTitle(param.getTitle());
		if(files.length > 0){
			item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, files[0],  1902, 480));
		}else{
			item.setFilePath(beforeData.getFilePath());
		}
		
		item.setCodeLangType(param.getCodeLang());
		item.setContent(param.getContent());
		item.setUrl(param.getUrl());
		item.setPrintFlag(param.getPrintFlag());
		item.setPrintOrder(param.getPrintOrder());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editBanner(item);
		
		MainBannerVO afterData = this.findBannerBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		adminUtilService.reloadServer();

		return true;
	}


	public int addBanner(final MainBannerAddPO param, final  MultipartFile file, final HttpServletRequest req) throws IOException, InterruptedException {
		//롤링 순서 조정
		updateBannerOrder(param.getPrintOrder() , param.getCodeLang(), true, req);
		
		MainBannerVO item = new MainBannerVO();
		
		item.setCodeLangType(param.getCodeLang());
		item.setTitle(param.getTitle());
		item.setContent(param.getContent());
		item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file, 1902, 480));
		item.setUrl(param.getUrl());
		item.setPrintFlag(param.getPrintFlag());
		item.setPrintOrder(param.getPrintOrder());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addBanner(item);
		
		MainBannerVO afterData = this.findBannerBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		
		adminUtilService.reloadServer();
		return item.getSeq();
	}

	
	public List<MainUserBannerListRO> findUserBannerList(){
		
		List<MainUserBannerListRO> result = mapper.userMainBannerList();
//		result.forEach(t ->{
//			try {
//				t.setFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + t.getFilePath()));
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
////				e.printStackTrace();
//			}
//		});
		
		return result;
	}

}
