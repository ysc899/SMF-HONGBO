package com.seegene.web.admin.main.popup.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.main.popup.vo.MainPopupAddDefaultRO;
import com.seegene.web.admin.main.popup.vo.MainPopupAddPO;
import com.seegene.web.admin.main.popup.vo.MainPopupEditPO;
import com.seegene.web.admin.main.popup.vo.MainPopupListRO;
import com.seegene.web.admin.main.popup.vo.MainPopupUserRO;
import com.seegene.web.admin.main.popup.vo.MainPopupVO;
import com.seegene.web.admin.main.popup.vo.MainPopupViewRO;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MainPopupMapper;

/**
 * 메인 팝업 서비스
 */
@Service
@Transactional
public class MainPopupService {

	@Autowired
	private MainPopupMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	private final String FILE_PATH = "popup";
	
	private MainPopupVO findPopupBySeq(final int seq){
		return mapper.findPopupBySeq(seq);
	}

	/**
	 * @param param 검색조건
	 * @return 팝업 리스트
	 */
	public CommonListReuslt<MainPopupListRO> findPopupList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<MainPopupListRO> list = mapper.findPopupList(param);
		int count = mapper.countPopupList(param);
		
		CommonListReuslt<MainPopupListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @return 팝업 등록 기본 정보
	 */
	public MainPopupAddDefaultRO getAddPopupDefaultInfo() {
		
		MainPopupAddDefaultRO item = new MainPopupAddDefaultRO();
		
		item.setLangCodes(codeService.findLangCode());
		/** 로그인 여부 코드 */
		item.setLoginCodes(codeService.findSlaveByMaster("menu-login"));
		
		return item;
	}
	/**
	 * @param param 팝업 등록 정보
	 * @param file 팝업 파일
	 * @param req req
	 * @return seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int addPopup(final MainPopupAddPO param, final MultipartFile file, final HttpServletRequest req) throws IOException, InterruptedException {
		
		
		MainPopupVO item = new MainPopupVO();
		item.setCodeLangType(param.getCodeLang());
		item.setCodeLoginType(param.getCodeLogin());
		item.setUrl(param.getUrl());
		item.setTitle(param.getTitle());
		
		BufferedImage image = null;
		if(file != null){
			image = ImageIO.read(file.getInputStream());
			item.setPopupImageWidth(image.getWidth());
			item.setPopupImageHeight(image.getHeight());
		}
		
		
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		if(StringUtils.isNotEmpty(param.getEndDate())){
			item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
		}

		//파일 처리
//		item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,590, 395));
//		item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,340, 405));
		item.setFilePath(fileComponent.writeFile(FILE_PATH, file));
		item.setPrintFlag(param.getPrintFlag());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addPopup(item);
		
		MainPopupVO afterData = this.findPopupBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		adminUtilService.reloadServer();
		return item.getSeq();
	}

	/**
	 * @param seq 팝업 seq
	 * @return 팝업 상세 정보
	 * @throws IOException 
	 */
	public MainPopupViewRO findPopupInfo(final int seq) throws IOException {
		
		MainPopupViewRO item = mapper.findPopupViewBySeq(seq);
		
		if(StringUtils.isNotEmpty(item.getFilePath())){
			item.setFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator + item.getFilePath()));
		}
		
		return item;
	}

	/**
	 * @param seq 팝업 seq
	 * @param req req
	 * @return 팝업 삭제 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deletePopup(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		MainPopupVO beforeData = this.findPopupBySeq(seq);
		
		MainPopupVO item = new MainPopupVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deletePopup(item);
		
		MainPopupVO afterData = this.findPopupBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		adminUtilService.reloadServer();
		return true;
	}

	/**
	 * @param param 수정정보
	 * @param files 수정 파일
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public boolean editPopup(final MainPopupEditPO param, final MultipartFile[] files, final HttpServletRequest req) throws IOException, InterruptedException {
		
		MainPopupVO beforeData = this.findPopupBySeq(param.getSeq());
		
		MainPopupVO item = new MainPopupVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeLoginType(param.getCodeLogin());
		item.setTitle(param.getTitle());
		item.setUrl(param.getUrl());
		item.setPrintFlag(param.getPrintFlag());
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		
		BufferedImage image = null;
	
		if(StringUtils.isNotEmpty(param.getEndDate())){
			item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
		}
		
		if(files.length > 0){
			MultipartFile file = files[0];
			image = ImageIO.read(file.getInputStream());
			item.setPopupImageWidth(image.getWidth());
			item.setPopupImageHeight(image.getHeight());
			//파일 처리
			item.setFilePath(fileComponent.writeFile(FILE_PATH, file));
//			item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,340, 405));
//			item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,590, 395));
//			item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,160, 55));
		}else{
			item.setFilePath(beforeData.getFilePath());
			item.setPopupImageWidth(beforeData.getPopupImageWidth());
			item.setPopupImageHeight(beforeData.getPopupImageHeight());
		}
		
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editPopup(item);
		
		MainPopupVO afterData = this.findPopupBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		adminUtilService.reloadServer();
		return true;
	}
	
	public List<MainPopupUserRO> findUserPopupList(){
		
		List<MainPopupUserRO> result = mapper.findMainUserPopup();
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
