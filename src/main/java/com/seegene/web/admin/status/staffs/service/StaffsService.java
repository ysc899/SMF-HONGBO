package com.seegene.web.admin.status.staffs.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.status.staffs.vo.StaffsAddDefaultRO;
import com.seegene.web.admin.status.staffs.vo.StaffsAddPO;
import com.seegene.web.admin.status.staffs.vo.StaffsEditDefaultRO;
import com.seegene.web.admin.status.staffs.vo.StaffsEditPO;
import com.seegene.web.admin.status.staffs.vo.StaffsHistoryVO;
import com.seegene.web.admin.status.staffs.vo.StaffsInfoVO;
import com.seegene.web.admin.status.staffs.vo.StaffsListRO;
import com.seegene.web.admin.status.staffs.vo.StaffsVO;
import com.seegene.web.admin.status.staffs.vo.StaffsViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.StaffsMapper;

/**
 * 의료진 현황 서비스
 * 
 * 
 */
@Service
@Transactional
public class StaffsService {
	
	@Autowired
	private StaffsMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	
	private final String FILE_PATH = "staffs";
	
	
	private StaffsVO findStaffsBySeq(final int seq){
		return mapper.findStaffsBySeq(seq);
	}
	
	private List<StaffsInfoVO> findStaffsInfoByStaffsSeq(final int staffsSeq){
		return mapper.findStaffsInfoByStaffsSeq(staffsSeq);
	}
	private List<StaffsHistoryVO> findStaffsHistoryByStaffsSeq(final int staffsSeq){
		return mapper.findStaffsHistoryByStaffsSeq(staffsSeq);
	}

	/**
	 * @param param 검색 조건
	 * @return 의료진 현황 리스트
	 */
	public CommonListReuslt<StaffsListRO> findStaffsList(final SearchPaggingCommonPO param) {
		param.setMybatisPagging();
		List<StaffsListRO> list = mapper.findStaffsList(param);
		int count = mapper.countStaffsList(param);
		
		CommonListReuslt<StaffsListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 의료진 현황 마스터 seq
	 * @return 의료진 현황 상세 정보
	 * @throws IOException 
	 */
	public StaffsViewRO findStaffsInfo(final int seq) throws IOException {
		
		StaffsViewRO result = mapper.findStaffsViewBySeq(seq);
		
		
		if(StringUtils.isNotEmpty(result.getImagePath())){
			result.setImageContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getImagePath()));
		}
		if(StringUtils.isNotEmpty(result.getThumImagePath())){
			result.setThumImageContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getThumImagePath()));
		}
		
		result.setInfoList(mapper.findStaffsInfoViewByStaffsSeq(seq));
		result.setHistoryList(mapper.findStaffsHistoryViewByStaffsSeq(seq));
		
		return result;
	}
	
	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateStaffsOrder(final int printOrder, final String codeCenterType, final String codePartType, final String masterFlag,  final boolean incFlag, final HttpServletRequest req){
		
		StaffsVO item = new StaffsVO();
		item.setPrintOrder(printOrder);
		item.setCodeCenterType(codeCenterType);
		item.setCodePartType(codePartType);
		item.setMasterFlag(masterFlag);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<StaffsVO> beforeData = mapper.checkStaffsOrder(item);
		
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateStaffsOrderInc(item);
			}else{
				mapper.updateStaffsOrderDec(item);
			}
			
			List<StaffsVO> afterData = mapper.checkStaffsOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
	}
	
	

	/**
	 * @param seq 의료진 정보 마스터 seq
	 * @param req req
	 * @return 삭제 성공 여부
	 */
	public boolean deleteStaffs(final int seq, final HttpServletRequest req) {
		StaffsVO beforeData = this.findStaffsBySeq(seq);
		
		StaffsVO param = new StaffsVO();
		param.setSeq(seq);
		param.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteStaffs(param);
		
		StaffsVO afterData = this.findStaffsBySeq(seq);
		logEditService.insertEditLog(req, beforeData, afterData);
		
		this.updateStaffsOrder(beforeData.getPrintOrder(), beforeData.getCodeCenterType(), beforeData.getCodePartType(), beforeData.getMasterFlag(), false, req);
		
		return true;
	}

	/**
	 * @return 의료진 현황 등록 기본 정보
	 */
	public StaffsAddDefaultRO getAddStaffsDefaultInfo() {
		
		StaffsAddDefaultRO item = new StaffsAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setCenterCodes(codeService.findSlaveByMaster("center"));
		item.setPartCodes(codeService.findSlaveByMaster("staffPart"));
		
		return item;
	}

	/**
	 * @param center 센터 코드
	 * @param part 부서 코드
	 * @param master 마스터
	 * @return
	 */
	public int maxPrintOrder(final String center, final String part, final boolean master) {
		StaffsVO param = new StaffsVO();
		param.setCodeCenterType(center);
		param.setCodePartType(part);
		if(master){
			param.setMasterFlag("Y");
		}else{
			param.setMasterFlag("N");
			
		}
		
		return mapper.getPrintOrder(param);
	}

	/**
	 * @param param 등록될 의료진 정보
	 * @param thumFile 섬네일 파일
	 * @param contentFile 내용팝업용 이미지
	 * @param req req
	 * @return 등록된 seq
	 * @throws IOException ioe
	 * @throws InterruptedException 
	 */
	public int addStaffs(final StaffsAddPO param, final MultipartFile[] thumFile, final MultipartFile[] contentFile,
			final HttpServletRequest req) throws IOException, InterruptedException {
		if(thumFile.length == 0){
			return -9;
		}
		if(contentFile.length == 0){
			return -8;
		}
		
		String regUserId = SessionUtil.getAuthUserId();
		
		Gson gson = new Gson();
		
		Type staffsInfoType = new TypeToken<List<StaffsInfoVO>>() {
		}.getType();
		Type staffsHistoryType = new TypeToken<List<StaffsHistoryVO>>() {
		}.getType();
		
		List<StaffsInfoVO> staffsInfoList = gson.fromJson(param.getStaffsInfoJSON(), staffsInfoType);
		List<StaffsHistoryVO> staffsHistoryList = gson.fromJson(param.getStaffsHistoryJSON(), staffsHistoryType);
		
		StaffsInfoVO koInfo = staffsInfoList.stream().filter(t -> {return t.getCodeLangType().equals("ko");}).findFirst().orElse(null);
		
		
		StaffsVO item = new StaffsVO();
		item.setCodeCenterType(param.getCodeCenterType());
		item.setCodePartType(param.getCodePartType());
		item.setMasterFlag(param.getMasterFlag());
		item.setName(koInfo.getName());
		item.setPrintOrder(param.getPrintOrder());
		item.setImagePath(fileComponent.writeFile(FILE_PATH, contentFile[0]));
		if(item.getMasterFlag().equals("Y")){
			item.setThumImagePath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
		}else{
			item.setThumImagePath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
		}
		item.setRegUserId(regUserId);
		
		this.updateStaffsOrder(item.getPrintOrder(), item.getCodeCenterType(), item.getCodePartType(), item.getMasterFlag(), true, req);
		
		mapper.addStaffs(item);
		
		staffsInfoList.forEach(target ->{
			target.setStaffsSeq(item.getSeq());
			target.setRegUserId(regUserId);
		});
		mapper.addStaffsInfos(staffsInfoList);
		
		staffsHistoryList.forEach(target ->{
			target.setStaffsSeq(item.getSeq());
			target.setRegUserId(regUserId);
		});
		mapper.addStaffsHistory(staffsHistoryList);
		
		
		StaffsVO afterData = this.findStaffsBySeq(item.getSeq());
		List<StaffsInfoVO> afterInfoData = this.findStaffsInfoByStaffsSeq(item.getSeq());
		List<StaffsHistoryVO> afterHistoryData = this.findStaffsHistoryByStaffsSeq(item.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		logEditService.insertAddLog(req, afterInfoData);
		logEditService.insertAddLog(req, afterHistoryData);
		
		return item.getSeq();
	}

	/**
	 * @param result 의료진 뷰용 정보
	 * @return 의료진 정보 수정용 기본 정보
	 */
	public StaffsEditDefaultRO getEditStaffsDefaultInfo(final StaffsViewRO result) {
		
		StaffsEditDefaultRO item = new StaffsEditDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setCenterCodes(codeService.findSlaveByMaster("center"));
		item.setPartCodes(codeService.findSlaveByMaster("staffPart"));
		
		item.setMaxOrder(this.maxPrintOrder(result.getCodeCenterType(), result.getCodePartType(), result.getMasterFlag().equals("Y")));
		
		return item;
	}

	/**
	 * @param param 수정 정보
	 * @param thumFile 섬네일 파일
	 * @param contentFile 본문 파일
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public boolean editStaffs(final StaffsEditPO param, final MultipartFile[] thumFile, final MultipartFile[] contentFile,
			final HttpServletRequest req) throws IOException, InterruptedException {
		
		StaffsVO beforeData = this.findStaffsBySeq(param.getSeq());
		List<StaffsInfoVO> beforeInfoData = this.findStaffsInfoByStaffsSeq(param.getSeq());
		List<StaffsHistoryVO> beforeHistoryData = this.findStaffsHistoryByStaffsSeq(param.getSeq());
		
		String editUserId = SessionUtil.getAuthUserId();
		
		if(!param.getCodeCenterType().equals(beforeData.getCodeCenterType()) 
			|| !param.getCodePartType().equals(beforeData.getCodePartType())
			|| !param.getMasterFlag().equals(beforeData.getMasterFlag())
			|| param.getPrintOrder() != beforeData.getPrintOrder()){
			
			this.updateStaffsOrder(beforeData.getPrintOrder(), beforeData.getCodeCenterType(), beforeData.getCodePartType(), beforeData.getMasterFlag(), false, req);
			this.updateStaffsOrder(param.getPrintOrder(), param.getCodeCenterType(), param.getCodePartType(), param.getMasterFlag(), true, req);
		}
		
		StaffsVO item = new StaffsVO();
		item.setSeq(param.getSeq());
		item.setCodeCenterType(param.getCodeCenterType());
		item.setCodePartType(param.getCodePartType());
		item.setMasterFlag(param.getMasterFlag());
		item.setPrintOrder(param.getPrintOrder());
		if(thumFile.length > 0){

			item.setThumImagePath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
//			if(item.getMasterFlag().equals("Y")){
//				item.setThumImagePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 223, 345));
//				item.setThumImagePath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
//			}else{
//				item.setThumImagePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 150, 160));
//			}
		}else{
			item.setThumImagePath(beforeData.getThumImagePath());
		}
		if(contentFile.length > 0){
//			item.setImagePath(fileComponent.writeImageThumFile(FILE_PATH, contentFile[0], 223, 345));
			item.setImagePath(fileComponent.writeFile(FILE_PATH, contentFile[0]));
		}else{
			item.setImagePath(beforeData.getImagePath());
		}
		item.setEditUserId(editUserId);
		
		
		
		
		
		mapper.editStaffs(item);
		
		
		Gson gson = new Gson();
		
		Type staffsInfoType = new TypeToken<List<StaffsInfoVO>>() {
		}.getType();
		Type staffsHistoryType = new TypeToken<List<StaffsHistoryVO>>() {
		}.getType();
		Type staffsDeleteHistoryType = new TypeToken<List<Integer>>() {
		}.getType();
		
		List<StaffsInfoVO> staffsInfoList = gson.fromJson(param.getStaffsInfoJSON(), staffsInfoType);
		List<StaffsHistoryVO> staffsHistoryList = gson.fromJson(param.getStaffsHistoryJSON(), staffsHistoryType);
		List<Integer> staffsDeleteHistory = gson.fromJson(param.getStaffsDeleteHistoryJSON(), staffsDeleteHistoryType);
		
		
		List<StaffsInfoVO> newStaffsInfoList = new ArrayList<StaffsInfoVO>();
		
		staffsInfoList.forEach(target ->{
			StaffsInfoVO bData = beforeInfoData.stream().filter(t ->{return t.getSeq() == target.getSeq();}).findFirst().orElse(null);
			target.setStaffsSeq(item.getSeq());
			if(bData == null){
				//신규 입력 데이터시 입력 처리
				target.setRegUserId(editUserId);
				newStaffsInfoList.add(target);
			}else{
				//데이터가 변경 되었는지 확인
				if(!bData.getPosition().equals(target.getPosition()) 
					|| !bData.getName().equals(target.getName())
					|| !bData.getDegree().equals(target.getDegree())
					|| !bData.getSpecialty().equals(target.getSpecialty())){
					
					target.setEditUserId(editUserId);
					
					mapper.editStaffsInfos(target);
				}
			}
		});
		//신규 입력된 내용들 처리
		if(newStaffsInfoList.size() > 0){
			mapper.addStaffsInfos(newStaffsInfoList);
		}
		
		//이력 삭제된것 처리
		if(staffsDeleteHistory != null && staffsDeleteHistory.size()> 0){
			
			staffsDeleteHistory.forEach(t ->{
				StaffsHistoryVO deleteParam = new StaffsHistoryVO();
				deleteParam.setSeq(t);
				deleteParam.setEditUserId(editUserId);
				mapper.deleteStaffsHistory(deleteParam);
			});
		}
		
		//신규 입력된것 처리
		List<StaffsHistoryVO> newHistory = staffsHistoryList.stream().filter(t ->{return t.getSeq() <= 0;}).collect(Collectors.toList());
		
		//기존 데이터 처리
		List<StaffsHistoryVO> oldHistory = staffsHistoryList.stream().filter(t ->{return t.getSeq() > 0;}).collect(Collectors.toList());
		
		oldHistory.forEach(target ->{
			StaffsHistoryVO bData = beforeHistoryData.stream().filter(t ->{return t.getSeq() == target.getSeq();}).findFirst().orElse(null);
			
			if(bData == null){
				//기존 데이터가 없을 경우 신규로 처리
				newHistory.add(target);
			}else{
				if(!bData.getCodeLangType().equals(target.getCodeLangType())
					|| !bData.getNowFlag().equals(target.getNowFlag()) 
					|| !bData.getContent().equals(target.getContent()) 
					|| !bData.getComment().equals(target.getComment()) 
					|| bData.getPrintOrder() != target.getPrintOrder()){
					//기존 데이터가 변경된경우
					
					target.setStaffsSeq(item.getSeq());
					target.setEditUserId(editUserId);
					
					mapper.editStaffsHistory(target);
				}
			}
		});
		//신규 입력된것 디비 처리
		if(newHistory.size() > 0){
			newHistory.forEach(target ->{
				target.setStaffsSeq(item.getSeq());
				target.setRegUserId(editUserId);
			});
			mapper.addStaffsHistory(newHistory);
		}
		
		
		StaffsVO afterData = this.findStaffsBySeq(param.getSeq());
		List<StaffsInfoVO> afterInfoData = this.findStaffsInfoByStaffsSeq(param.getSeq());
		List<StaffsHistoryVO> afterHistoryData = this.findStaffsHistoryByStaffsSeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);
		logEditService.insertEditLog(req, beforeInfoData, afterInfoData);
		logEditService.insertEditLog(req, beforeHistoryData, afterHistoryData);
		
		return true;
	}
	
}

