package com.seegene.web.admin.inspection.vessel.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselAddDefaultRO;
import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselEditDefaultRO;
import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselListRO;
import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselViewRO;
import com.seegene.web.admin.inspection.vessel.vo.VesselVO;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.InspectionVesselMapper;

@Service
@Transactional
public class InspectionVesselService {
	
	
	@Autowired
	private InspectionVesselMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "vessel";

	
	private VesselVO findVesselBySeq(final int seq){
		return mapper.findVesselBySeq(seq);
	}
	
	/**
	 * @param param 검색조건
	 * @return 검체용기 리스트
	 */
	public CommonListReuslt<InspectionVesselListRO> findVesselList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<InspectionVesselListRO> list = mapper.findVesselList(param);
		int count = mapper.countVesselList(param);
		
		CommonListReuslt<InspectionVesselListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 검체용기 식별자
	 * @return 검체용기 상세정보
	 * @throws IOException ioe
	 */
	public InspectionVesselViewRO findVesselInfo(final int seq) throws IOException {
		
		InspectionVesselViewRO item = mapper.findVesselViewBySeq(seq);
		if(item != null){
			item.setFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator + item.getFilePath()));
		}
		
		return item;
	}

	/**
	 * @return 검체용기 등록시 사용할 기본 정보
	 */
	public InspectionVesselAddDefaultRO getAddVesselDefaultInfo() {
		
		InspectionVesselAddDefaultRO item = new InspectionVesselAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setVesselSCCodes(codeService.findSlaveByMaster("vesselSC"));
		
		return item;
	}
	
	public InspectionVesselEditDefaultRO getEditVesselDefaultInfo(final String codeLang) {

		InspectionVesselEditDefaultRO item = new InspectionVesselEditDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setVesselSCCodes(codeService.findSlaveByMaster("vesselSC"));
		
		item.setMaxOrder(this.maxPrintOrder(codeLang));
		
		return item;
	}
	
	
	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateVesselOrder(final int printOrder, final String langCode,  final boolean incFlag, final HttpServletRequest req){
		
		VesselVO item = new VesselVO();
		item.setPrintOrder(printOrder);
		item.setCodeLangType(langCode);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<VesselVO> beforeData = mapper.checkVesselOrder(item);
		
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateVesselOrderInc(item);
			}else{
				mapper.updateVesselOrderDec(item);
			}
			
			List<VesselVO> afterData = mapper.checkVesselOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
	}
	

	/**
	 * @param param 검체용기 등록정보
	 * @param requestFile 검체용기 파일
	 * @param req req
	 * @return 검체용기 식별자
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int addVessel(final VesselVO param, final MultipartFile vesselFile, final HttpServletRequest req) throws IOException, InterruptedException {
		
		param.setFilePath(fileComponent.writeFile(FILE_PATH, vesselFile));
		param.setRegUserId(SessionUtil.getAuthUserId());
		
		this.updateVesselOrder(param.getPrintOrder(), param.getCodeLangType(), true, req);
		
		mapper.addVessel(param);
		
		VesselVO afterData = findVesselBySeq(param.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		
		return param.getSeq();
	}

	/**
	 * @param seq 검체용기 식별자
	 * @param req req
	 * @return 검체용기 삭제 성공 여부
	 */
	public boolean deleteVessel(final int seq, final HttpServletRequest req) {

		VesselVO beforeData = findVesselBySeq(seq);
		
		VesselVO param = new VesselVO();
		param.setSeq(seq);
		param.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteVessel(param);
		
		VesselVO afterData = findVesselBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		this.updateVesselOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), false, req);
		
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
	public boolean editVessel(final VesselVO param, final MultipartFile[] vesselFiles, final HttpServletRequest req) throws IOException, InterruptedException {
		
		VesselVO beforeData = findVesselBySeq(param.getSeq());
		
		
		if(!param.getCodeLangType().equals(beforeData.getCodeLangType()) || param.getPrintOrder() != beforeData.getPrintOrder()){
			this.updateVesselOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), false, req);	
			this.updateVesselOrder(param.getPrintOrder(), param.getCodeLangType(),true, req);	
		}
		
		param.setEditUserId(SessionUtil.getAuthUserId());
		
		//파일 관련 처리
		if(vesselFiles.length > 0){
			param.setFilePath(fileComponent.writeFile(FILE_PATH, vesselFiles[0]));
		}else{
			param.setFilePath(beforeData.getFilePath());
		}
		
		mapper.editVessel(param);
		
		VesselVO afterData = findVesselBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

	public int maxPrintOrder(final String lang) {
		VesselVO param = new VesselVO();
		param.setCodeLangType(lang);
		return mapper.getPrintOrder(param);
	}

	
	
	
}

