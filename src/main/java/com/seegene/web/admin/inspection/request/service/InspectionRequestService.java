package com.seegene.web.admin.inspection.request.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestAddDefaultRO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestEditDefaultRO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestListRO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestVO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestViewRO;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.InspectionRequestMapper;

@Service
@Transactional
public class InspectionRequestService {
	
	
	@Autowired
	private InspectionRequestMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "InspectionRequest";

	
	private InspectionRequestVO findRequestBySeq(final int seq){
		return mapper.findRequestBySeq(seq);
	}
	
	/**
	 * @param param 검색조건
	 * @return 검사의뢰서 리스트
	 */
	public CommonListReuslt<InspectionRequestListRO> findRequestList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<InspectionRequestListRO> list = mapper.findRequestList(param);
		int count = mapper.countRequestList(param);
		
		CommonListReuslt<InspectionRequestListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 검사의뢰서 식별자
	 * @return 검사의뢰서 상세정보
	 * @throws IOException ioe
	 */
	public InspectionRequestViewRO findRequestInfo(final int seq) throws IOException {
		
		InspectionRequestViewRO item = mapper.findRequestViewBySeq(seq);
		
		if(item.getThumFlag().equals("Y") && StringUtils.isNotEmpty(item.getThumFilePath())){
			item.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + item.getThumFilePath()));
		}
		
		return item;
	}

	/**
	 * @return 검사의뢰서 등록시 사용할 기본 정보
	 */
	public InspectionRequestAddDefaultRO getAddRequestDefaultInfo() {
		
		InspectionRequestAddDefaultRO item = new InspectionRequestAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		
		return item;
	}

	/**
	 * @param lang 언어코드
	 * @param thumFlag 섬네일 여부
	 * @return 출력 순서 카운트
	 */
	public int maxPrintOrder(final String lang, final boolean thumFlag) {
		
		InspectionRequestVO param = new InspectionRequestVO();
		param.setCodeLangType(lang);
		if(thumFlag){
			param.setThumFlag("Y");
		}else{
			param.setThumFlag("N");
		}
		
		return mapper.getPrintOrder(param);
	}

	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateRequestOrder(final int printOrder, final String langCode, final String thumFlag,  final boolean incFlag, final HttpServletRequest req){
		
		InspectionRequestVO item = new InspectionRequestVO();
		item.setPrintOrder(printOrder);
		item.setCodeLangType(langCode);
		item.setThumFlag(thumFlag);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<InspectionRequestVO> beforeData = mapper.checkRequestOrder(item);
		
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateRequestOrderInc(item);
			}else{
				mapper.updateRequestOrderDec(item);
			}
			
			List<InspectionRequestVO> afterData = mapper.checkRequestOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
	}
	
	/**
	 * @param param 검사의뢰서 등록정보
	 * @param requestFile 검사의뢰서 파일
	 * @param req req
	 * @return 검사의뢰서 식별자
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int addRequest(final InspectionRequestVO param, final MultipartFile requestFile, final MultipartFile[] thumFile, final HttpServletRequest req) throws IOException, InterruptedException {
		
		InspectionRequestVO item = new InspectionRequestVO();
		item.setCodeLangType(param.getCodeLangType());
		item.setTitle(param.getTitle());
		item.setFilePath(fileComponent.writeFile(FILE_PATH, requestFile));
		item.setFileName(requestFile.getOriginalFilename());
		item.setThumFlag(param.getThumFlag());
		if(item.getThumFlag().equals("Y")){
			
			if(thumFile.length >0){
				item.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 530, 720));
				
			}else{
				List<String> pdfToImageList = fileComponent.pdfToImage(fileComponent.getTempFileFolder(), requestFile);
				if(pdfToImageList.size() > 0){
					String path = pdfToImageList.get(0);
	//				251 × 353
					File tempImageFile = new File(fileComponent.getDefaultFilePath() + File.separator + fileComponent.getTempFileFolder() + File.separator + path);
	//				item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, tempImageFile, 251, 353));
					item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, tempImageFile, 530, 720));
				}
			}
		}
		
		item.setPrintOrder(param.getPrintOrder());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		this.updateRequestOrder(item.getPrintOrder(), item.getCodeLangType(),item.getThumFlag(), true, req);
		
		mapper.addRequest(item);
		
		InspectionRequestVO afterData = findRequestBySeq(item.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		
		return item.getSeq();
	}

	public InspectionRequestEditDefaultRO getEditRequestDefaultInfo(final InspectionRequestViewRO request) {

		InspectionRequestEditDefaultRO item = new InspectionRequestEditDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setMaxOrder(this.maxPrintOrder(request.getCodeLangType(), request.getThumFlag().equals("Y")));
		
		return item;
	}

	/**
	 * @param seq 검사의뢰서 식별자
	 * @param req req
	 * @return 검사의뢰서 삭제 성공 여부
	 */
	public boolean deleteRequest(final int seq, final HttpServletRequest req) {

		InspectionRequestVO beforeData = findRequestBySeq(seq);
		
		InspectionRequestVO param = new InspectionRequestVO();
		param.setSeq(seq);
		param.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteRequest(param);
		
		InspectionRequestVO afterData = findRequestBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		this.updateRequestOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(),beforeData.getThumFlag(), false, req);
		
		return true;
	}

	/**
	 * @param param 수정 정보
	 * @param requestFile 리퀘스트 파일
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public boolean editdRequest(final InspectionRequestVO param, final MultipartFile[] requestFile, final MultipartFile[] thumFile, final HttpServletRequest req) throws IOException, InterruptedException {
		
		InspectionRequestVO beforeData = findRequestBySeq(param.getSeq());
		
		if(!param.getThumFlag().equals(beforeData.getThumFlag()) || !param.getCodeLangType().equals(beforeData.getCodeLangType()) || param.getPrintOrder() != beforeData.getPrintOrder()){
			this.updateRequestOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(),beforeData.getThumFlag(), false, req);	
			this.updateRequestOrder(param.getPrintOrder(), param.getCodeLangType(),param.getThumFlag(), true, req);	
		}
		
		InspectionRequestVO item = new InspectionRequestVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLangType());
		item.setTitle(param.getTitle());
		item.setPrintOrder(param.getPrintOrder());
		item.setEditUserId(SessionUtil.getAuthUserId());
		item.setThumFlag(param.getThumFlag());
		
		//섬네일 관련 처리
		if(beforeData.getThumFlag().equals("N") && param.getThumFlag().equals("Y")){
			
			if(StringUtils.isNotEmpty(beforeData.getFilePath())){
			
				if(thumFile.length > 0){
					item.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 530, 720));
				}else{
					File imageFile = new File(fileComponent.getDefaultFilePath() + File.separator + FILE_PATH + File.separator + beforeData.getFilePath());
					
					List<String> pdfToImageList = fileComponent.pdfToImage(fileComponent.getTempFileFolder(), imageFile);
					if(pdfToImageList.size() > 0){
						String path = pdfToImageList.get(0);
		//				251 × 353
						File tempImageFile = new File(fileComponent.getDefaultFilePath() + File.separator + fileComponent.getTempFileFolder() + File.separator + path);
	//					item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, tempImageFile, 251, 353));
						item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, tempImageFile, 530, 720));
					}
				}
			}
			
		}else if(beforeData.getThumFlag().equals("Y") && param.getThumFlag().equals("Y")){
			if(thumFile.length >0){
				item.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 530, 720));
			}else{
				item.setThumFilePath(beforeData.getThumFilePath());
			}
		}else if(param.getThumFlag().equals("N")){
			item.setThumFilePath("");
		}
		
		//파일 관련 처리
		if(requestFile.length > 0){
			item.setFilePath(fileComponent.writeFile(FILE_PATH, requestFile[0]));
			item.setFileName(requestFile[0].getOriginalFilename());
			if(item.getThumFlag().equals("Y")){
				if(thumFile.length > 0){
					item.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 530, 720));
				}else{
					List<String> pdfToImageList = fileComponent.pdfToImage(fileComponent.getTempFileFolder(), requestFile[0]);
					if(pdfToImageList.size() > 0){
						String path = pdfToImageList.get(0);
	//					251 × 353
						File tempImageFile = new File(fileComponent.getDefaultFilePath() + File.separator + fileComponent.getTempFileFolder() + File.separator + path);
	//					item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, tempImageFile, 251, 353));
						item.setThumFilePath(fileComponent.writeThumFile(FILE_PATH, tempImageFile, 530, 720));
					}
				}
			}else{
				item.setThumFilePath("");
			}
		}else{
			item.setFilePath(beforeData.getFilePath());
			item.setFileName(beforeData.getFileName());
		}
		
		mapper.editRequest(item);
		
		InspectionRequestVO afterData = findRequestBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

	/**
	 * @param seq 검사의뢰서 seq
	 * @param request 리퀘스트
	 * @param response 리스폰
	 */
	public void downloadFile(final int seq, final HttpServletRequest request,final HttpServletResponse response) {
		InspectionRequestVO item = mapper.findRequestFileInfoBySeq(seq);
		
		if(item == null || StringUtils.isEmpty(item.getFilePath())){
			return;
		}
		fileComponent.downloadFile(FILE_PATH, item.getFilePath(), item.getFileName(), request, response);
		
	}
	
	
	
}

