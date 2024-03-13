package com.seegene.web.admin.main.logo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.main.logo.vo.MainLogoAddDefaultRO;
import com.seegene.web.admin.main.logo.vo.MainLogoAddPO;
import com.seegene.web.admin.main.logo.vo.MainLogoCheckDatePO;
import com.seegene.web.admin.main.logo.vo.MainLogoCheckEditDatePO;
import com.seegene.web.admin.main.logo.vo.MainLogoEditPO;
import com.seegene.web.admin.main.logo.vo.MainLogoListRO;
import com.seegene.web.admin.main.logo.vo.MainLogoVO;
import com.seegene.web.admin.main.logo.vo.MainLogoViewRO;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MainLogoMapper;

/**
 * 메인 로고 서비스
 */
@Service
@Transactional
public class MainLogoService {

	@Autowired
	private MainLogoMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	private final String FILE_PATH = "logo";
	
	private MainLogoVO findLogoBySeq(final int seq){
		return mapper.findLogoBySeq(seq);
	}

	/**
	 * @param param 검색조건
	 * @return 로고 리스트
	 */
	public CommonListReuslt<MainLogoListRO> findLogoList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<MainLogoListRO> list = mapper.findLogoList(param);
		int count = mapper.countLogoList(param);
		
		CommonListReuslt<MainLogoListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @return 로고 등록 기본 정보
	 */
	public MainLogoAddDefaultRO getAddLogoDefaultInfo() {
		
		MainLogoAddDefaultRO item = new MainLogoAddDefaultRO();
		
		item.setLangCodes(codeService.findLangCode());
		item.setTypeCodes(codeService.findSlaveByMaster("logo"));
		
		return item;
	}

	/**
	 * @param param 기간 확인 용 파라미터
	 * @return 중복 여부
	 */
	public boolean checkDate(final MainLogoCheckDatePO param) {
		
		MainLogoVO item = new MainLogoVO();
		
		item.setCodeLangType(param.getCodeLang());
		item.setCodeLogoType(param.getCodeType());
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
		
		int result = mapper.checkDate(item);
		
		return result == 0;
	}
	
	/**
	 * @param param 기간 확인 용 파라미터
	 * @return 중복 여부
	 */
	public boolean checkDate(final MainLogoCheckEditDatePO param) {
		
		MainLogoVO item = new MainLogoVO();
		
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeLogoType(param.getCodeType());
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
		
		int result = mapper.checkEditDate(item);
		
		return result == 0;
	}

	/**
	 * @param param 로고 등록 정보
	 * @param file 로고 파일
	 * @param req req
	 * @return seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int addLogo(final MainLogoAddPO param, final MultipartFile file, final HttpServletRequest req) throws IOException, InterruptedException {
		
		
		MainLogoVO item = new MainLogoVO();
		item.setCodeLangType(param.getCodeLang());
		item.setCodeLogoType(param.getCodeType());
		item.setName(param.getName());
		
		if(StringUtils.isNotEmpty(param.getUrl()) && item.getCodeLogoType().equals("left")){
			item.setUrl(param.getUrl());
		}
		
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
			
			MainLogoCheckDatePO checkItem = new MainLogoCheckDatePO();
			checkItem.setCodeLang(param.getCodeLang());
			checkItem.setCodeType(param.getCodeType());
			checkItem.setStartDate(param.getStartDate());
			checkItem.setEndDate(param.getEndDate());
			if(!this.checkDate(checkItem)){
				//기간 중복
				return -9;
			}
		}

		//파일 처리
		if(item.getCodeLogoType().equals("left")){
			item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,160, 55));
		}else{
			item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,211, 45));
		}
		item.setFileName(file.getOriginalFilename());
		item.setFileSize(file.getSize());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addLogo(item);
		
		MainLogoVO afterData = this.findLogoBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		adminUtilService.reloadServer();
		return item.getSeq();
	}

	/**
	 * @param seq 로고 seq
	 * @return 로고 상세 정보
	 * @throws IOException 
	 */
	public MainLogoViewRO findLogoInfo(final int seq) throws IOException {
		
		MainLogoViewRO item = mapper.findLogoViewBySeq(seq);
		
		item.setLogoImage(fileComponent.getImageToBase64(FILE_PATH+File.separator + item.getFilePath()));
		
		return item;
	}

	/**
	 * @param seq 로고 seq
	 * @param req req
	 * @return 로고 삭제 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deleteLogo(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		MainLogoVO beforeData = this.findLogoBySeq(seq);
		
		MainLogoVO item = new MainLogoVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteLogo(item);
		
		MainLogoVO afterData = this.findLogoBySeq(seq);
		
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
	public boolean editLogo(final MainLogoEditPO param, final MultipartFile[] files, final HttpServletRequest req) throws IOException, InterruptedException {
		
		MainLogoVO beforeData = this.findLogoBySeq(param.getSeq());
		
		MainLogoVO item = new MainLogoVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeLogoType(param.getCodeType());
		item.setName(param.getName());
		if(item.getCodeLogoType().equals("left")){
			item.setUrl(param.getUrl());
		}
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
			
			MainLogoCheckEditDatePO checkItem = new MainLogoCheckEditDatePO();
			checkItem.setSeq(param.getSeq());
			checkItem.setCodeLang(param.getCodeLang());
			checkItem.setCodeType(param.getCodeType());
			checkItem.setStartDate(param.getStartDate());
			checkItem.setEndDate(param.getEndDate());
			if(!this.checkDate(checkItem)){
				//기간 중복
				return false;
			}
		}
		
		if(files.length > 0){
			MultipartFile file = files[0];
			//파일 처리
//			item.setFilePath(fileComponent.writeFile(FILE_PATH, file));
			if(item.getCodeLogoType().equals("left")){
				item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,160, 55));
			}else{
				item.setFilePath(fileComponent.writeImageThumFile(FILE_PATH, file,211, 45));
			}
			item.setFileName(file.getOriginalFilename());
			item.setFileSize(file.getSize());
		}else{
			item.setFilePath(beforeData.getFilePath());
			item.setFileName(beforeData.getFileName());
			item.setFileSize(beforeData.getFileSize());
		}
		
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editLogo(item);
		
		MainLogoVO afterData = this.findLogoBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		adminUtilService.reloadServer();
		return true;
	}
	
}
