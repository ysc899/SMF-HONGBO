package com.seegene.web.admin.status.certification.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.status.certification.vo.CertificationAddDefaultRO;
import com.seegene.web.admin.status.certification.vo.CertificationAddPO;
import com.seegene.web.admin.status.certification.vo.CertificationEditDefaultRO;
import com.seegene.web.admin.status.certification.vo.CertificationEditPO;
import com.seegene.web.admin.status.certification.vo.CertificationListRO;
import com.seegene.web.admin.status.certification.vo.CertificationVO;
import com.seegene.web.admin.status.certification.vo.CertificationViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.CertificationMapper;

@Service
@Transactional
public class CertificationService {
	
	@Autowired
	private CertificationMapper mapper;

	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	private final String FILE_PATH = "certification";
	
	private CertificationVO findCertificationBySeq(final int seq){
		return mapper.findCertificationBySeq(seq);
	}
	
	/**
	 * @param param 검색조건
	 * @return 리스트
	 */
	public CommonListReuslt<CertificationListRO> findCertificationList(final SearchPaggingCommonPO param) {
		param.setMybatisPagging();
		List<CertificationListRO> list = mapper.findCertificationList(param);
		int count = mapper.countCertificationList(param);
		
		CommonListReuslt<CertificationListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 식별자
	 * @return 인증현황 정보
	 * @throws IOException 
	 */
	public CertificationViewRO findCertificationInfo(final int seq) throws IOException {
		CertificationViewRO item = mapper.findCertificationViewBySeq(seq);
		
		if(StringUtils.isNotEmpty(item.getFilePath())){
			item.setFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + item.getFilePath()));
		}
		
		if(StringUtils.isNotEmpty(item.getThumFilePath())){
			item.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + item.getThumFilePath()));
		}
		
		return item;
	}

	/**
	 * @return 인증정보 현황 등록 기본 정보
	 */
	public CertificationAddDefaultRO getAddCertificationDefaultInfo() {
		
		CertificationAddDefaultRO item = new CertificationAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setCategoryCodes(codeService.findSlaveByMaster("cert"));
		item.setCenterCodes(codeService.findSlaveByMaster("center"));
		item.setCertLocCodes(codeService.findSlaveByMaster("certLoc"));
		
		return item;
	}

	/**
	 * @param lang 언어코드
	 * @return 사이즈 수
	 */
	public int maxPrintOrder(final String lang, final String centerCode, final String certCode, final String certLocCode ) {
		
		CertificationVO param = new CertificationVO();
		param.setCodeLangType(lang);
		param.setCodeCenterType(centerCode);
		param.setCodeCertType(certCode);
		param.setCodeCertLocType(certLocCode);
		
		
		return mapper.getPrintOrder(param);
	}
	
	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateCertificationOrder(final int printOrder, final String langCode, final String centerCode, final String certCode, final String certLocCode, final boolean incFlag, final HttpServletRequest req){
		
		CertificationVO item = new CertificationVO();
		item.setPrintOrder(printOrder);
		item.setCodeLangType(langCode);
		item.setCodeCenterType(centerCode);
		item.setCodeCertType(certCode);
		item.setCodeCertLocType(certLocCode);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<CertificationVO> beforeData = mapper.checkCertificationOrder(item);
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateCertificationOrderInc(item);
			}else{
				mapper.updateCertificationOrderDec(item);
			}
			
			List<CertificationVO> afterData = mapper.checkCertificationOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
		
	}

	/**
	 * @param param 등록 정보
	 * @param certFile 인증서 파일정보
	 * @param thumFile 섬네일 파일 정보
	 * @param req req
	 * @return 등록된 인증현황 식별자
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int addCertification(final CertificationAddPO param, final MultipartFile certFile, final MultipartFile[] thumFile,
			final HttpServletRequest req) throws IOException, InterruptedException {
		
		CertificationVO item = new CertificationVO();
		item.setCodeLangType(param.getCodeLang());
		item.setCodeCertType(param.getCodeCertType());
		item.setCodeCenterType(param.getCodeCenterType());
		
//		if(item.getCodeCenterType().equals("seoul")){
			item.setCodeCertLocType(param.getCodeCertLocType());
//		}else{
//			item.setCodeCertLocType("korea");
//		}
//		item.setCategory(param.getCategory());
		item.setTitle(param.getTitle());
		
		//기능 추가 요청
		//인증 기관
		item.setIssuingAgency(param.getIssuingAgency());
		
		item.setContent(param.getContent());
		item.setPrintOrder(param.getPrintOrder());
		item.setPrintFlag(param.getPrintFlag());
		
		//파일 처리
		item.setFilePath(fileComponent.writeFile(FILE_PATH, certFile));
		item.setFileName(certFile.getOriginalFilename());
		
		if(thumFile.length > 0){
//			item.setThumFilePath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
			item.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 253, 359));
		}else{
			item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, item.getFilePath(), 253, 359));
		}
		
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		this.updateCertificationOrder(item.getPrintOrder(), item.getCodeLangType(), item.getCodeCenterType(), item.getCodeCertType(), item.getCodeCertLocType(), true, req);
		
		mapper.addCertification(item);
		
		CertificationVO afterData = this.findCertificationBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		
		return item.getSeq();
	}

	/**
	 * @param seq 식별자
	 * @param req req
	 * @return 삭제 성공 여부
	 */
	public boolean deleteCertification(final int seq, final HttpServletRequest req) {
		
		CertificationVO beforeData = this.findCertificationBySeq(seq);
		
		CertificationVO item = new CertificationVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteCertification(item);
		
		CertificationVO afterData = this.findCertificationBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		this.updateCertificationOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), beforeData.getCodeCenterType(), beforeData.getCodeCertType(), beforeData.getCodeCertLocType(), false, req);
		
		return true;
	}

	/**
	 * @param lang 언어코드
	 * @return 수정시 필요한 기본 정보
	 */
	public CertificationEditDefaultRO getEditCertificationDefaultInfo(final CertificationViewRO cert) {
		CertificationEditDefaultRO item = new CertificationEditDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setCategoryCodes(codeService.findSlaveByMaster("cert"));
		item.setCenterCodes(codeService.findSlaveByMaster("center"));
		item.setCertLocCodes(codeService.findSlaveByMaster("certLoc"));
		
		item.setMaxOrder(this.maxPrintOrder(cert.getCodeLangType(), cert.getCodeCenterType(), cert.getCodeCertType(), cert.getCodeCertLocType()));
		return item;
	}

	/**
	 * @param param 수정 정보
	 * @param certFile 인증서 파일
	 * @param thumFile 섬네일 파일
	 * @param req req
	 * @return 수정 성고 ㅇ여부
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public boolean editCertification(final CertificationEditPO param, final MultipartFile[] certFile, final MultipartFile[] thumFile,
			final HttpServletRequest req) throws IOException, InterruptedException {
		
		CertificationVO beforeData = this.findCertificationBySeq(param.getSeq());
		
//		if(!param.getCodeCenterType().equals("seoul")){
//			param.setCodeCertLocType("korea");
//		}
		
		if(!beforeData.getCodeLangType().equals(param.getCodeLang()) || 
				beforeData.getPrintOrder() != param.getPrintOrder() || 
				!beforeData.getCodeCenterType().equals(param.getCodeCenterType()) ||
				!beforeData.getCodeCertType().equals(param.getCodeCertType()) ||
				!beforeData.getCodeCertLocType().equals(param.getCodeCertLocType())
				){
			//언어 코드가 변경 되거나 출력 순서가 변경된 경우
			this.updateCertificationOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(),  beforeData.getCodeCenterType(), beforeData.getCodeCertType(), beforeData.getCodeCertLocType(), false, req);
			this.updateCertificationOrder(param.getPrintOrder(), param.getCodeLang(),  param.getCodeCenterType(), param.getCodeCertType(), param.getCodeCertLocType(), true, req);
		}
		
		CertificationVO item = new CertificationVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeCertType(param.getCodeCertType());
		item.setCodeCenterType(param.getCodeCenterType());
		item.setCodeCertLocType(param.getCodeCertLocType());
		
		item.setTitle(param.getTitle());
		
		item.setIssuingAgency(param.getIssuingAgency());
		
		item.setContent(param.getContent());
		item.setPrintOrder(param.getPrintOrder());
		item.setPrintFlag(param.getPrintFlag());
		
		item.setFilePath(beforeData.getFilePath());
		item.setFileName(beforeData.getFileName());
		item.setThumFilePath(beforeData.getThumFilePath());
		
		//파일 처리
		if(certFile.length > 0){
			item.setFilePath(fileComponent.writeFile(FILE_PATH, certFile[0]));
			item.setFileName(certFile[0].getOriginalFilename());
			
			if(thumFile.length > 0){
//				item.setThumFilePath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
				item.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 253, 359));
			}else{
				item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, item.getFilePath(), 253, 359));
			}
		}else if(thumFile.length > 0){
//			item.setThumFilePath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
			item.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 253, 359));
		}
		
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editCertification(item);
		
		
		CertificationVO afterData = this.findCertificationBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		
		return true;
	}
}

