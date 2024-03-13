package com.seegene.web.admin.health.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.health.vo.HealinfoTestEditPO;
import com.seegene.web.admin.health.vo.HealinfoTestPO;
import com.seegene.web.admin.health.vo.HealthInfoAddDefaultRO;
import com.seegene.web.admin.health.vo.HealthInfoAddPO;
import com.seegene.web.admin.health.vo.HealthInfoEditPO;
import com.seegene.web.admin.health.vo.HealthInfoListRO;
import com.seegene.web.admin.health.vo.HealthInfoSourceEditPO;
import com.seegene.web.admin.health.vo.HealthInfoSourceVO;
import com.seegene.web.admin.health.vo.HealthInfoTestCodeVO;
import com.seegene.web.admin.health.vo.HealthInfoTestEditRO;
import com.seegene.web.admin.health.vo.HealthInfoTestHardInfoVO;
import com.seegene.web.admin.health.vo.HealthInfoVO;
import com.seegene.web.admin.health.vo.HealthInfoViewRO;
import com.seegene.web.admin.health.vo.HealthinfoCommonDeletePO;
import com.seegene.web.admin.inspection.test.service.InspectionTestService;
import com.seegene.web.admin.inspection.test.vo.InspectionTestSearchOption;
import com.seegene.web.admin.inspection.test.vo.MWT001R1ListRO;
import com.seegene.web.admin.inspection.test.vo.MWT001R2ViewRO;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.HealthInfoMapper;

/**
 * 원클릭 건강정보 서비스
 */
@Service
@Transactional
public class HealthService {

	@Autowired
	private HealthInfoMapper mapper;
	
	@Autowired
	private InspectionTestService inspectionTestService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	/** 건강정보 파일 경로 */
	private final String FILE_PATH = "healthInfo";
	
	
	/**
	 * @param seq 식별자
	 * @return 건강정보
	 */
	private HealthInfoVO findHealthInfoBySeq(final int seq){
		return mapper.findHealthInfoBySeq(seq);
	}
	

	/**
	 * @param param 검색 조건
	 * @return 건강정보 검색된 결과
	 */
	public CommonListReuslt<HealthInfoListRO> findHealthList(final SearchPaggingCommonPO param) {
		param.setMybatisPagging();
		List<HealthInfoListRO> list = mapper.findHelthInfoList(param);
		int count = mapper.countHelthInfoList(param);
		
		CommonListReuslt<HealthInfoListRO> result = new CommonListReuslt<>(list, count, param);
		return result;
	}

	/**
	 * @param seq 식별자
	 * @param req req
	 * @return 건강정보 상세 정보
	 * @throws IOException ioe
	 */
	public HealthInfoViewRO findHealthInfoInfo(final int seq, final HttpServletRequest req) throws IOException {
		HealthInfoViewRO result = mapper.findHealthInfoViewBySeq(seq);
		
		result.setSources(mapper.findHealthSourceViewByHealthSeq(seq));
		result.setTests(mapper.findHealthTestViewByHealthSeq(seq).stream().sorted().collect(Collectors.toList()));
		
//		result.getTests().stream().
//		filter(item -> { return item.getHardFlag().equals("N");}).
//		forEach(item -> {
//			item.setTestName(inspectionTestService.getTestName(item.getTestCode(), req));
//		});
		
		if(result.getImgThumFlag().equals("Y")){
			result.setImgTitleThumBase64(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getImgTitleThumPath()));
		}
		if(result.getImgContentFlag().equals("Y")){
			result.setImgContentBase64(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getImgContentPath()));
		}
	
		return result;
	}
	
	
	
	/**
	 * @param seq 테스트 코드 seq
	 * @param type 테스트 입력 종류
	 * @return 검사 코드 정보
	 */
	public HealthInfoTestHardInfoVO findHealthTestInfo(final int seq, final String type, final HttpServletRequest req) {
		
		HealthInfoTestHardInfoVO item = null;
		
		if(type.equals("Y")){
			//수기 입력인 경우
			item = mapper.findHealthTestHardInfoBySeq(seq);
			
		}else if(type.equals("N")){
			
			item = mapper.findHealthTestInfoBySeq(seq);
			
			MWT001R2ViewRO inspectionData = inspectionTestService.findInspectionTestView(item.getTestCode(), req);
//			item.setTestName(inspectionData.getF010fkn());
			item.setSpecimen(inspectionData.getF010tnm());
			item.setVolume("");
			item.setTestMethod(inspectionData.getF010msnm());
			item.setTestDay(inspectionData.getT001day());
			item.setProcessDay(inspectionData.getF010eed());
			
			
		}
		
		return item;
	}
	
	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateHealthInfoOrder( final int printOrder, final String langCode, final boolean incFlag, final HttpServletRequest req){
		
		HealthInfoVO item = new HealthInfoVO();
		item.setPrintOrder(printOrder);
		item.setCodeLangType(langCode);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<HealthInfoVO> beforeData = mapper.checkHealthInfoOrder(item);
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateHealthInfoOrderInc(item);
			}else{
				mapper.updateHealthInfoOrderDec(item);
			}
			
			List<HealthInfoVO> afterData = mapper.checkHealthInfoOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
		
	}
	

	/**
	 * @param seq 건강정보 seq
	 * @param req req
	 * @return 삭제 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deleteHealthInfo(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		HealthInfoVO beforeData = this.findHealthInfoBySeq(seq);
		
		HealthInfoVO item = new HealthInfoVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteHealthInfo(item);
		
		HealthInfoVO afterData = this.findHealthInfoBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		this.updateHealthInfoOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), false, req);
		adminUtilService.reloadServer();
		return true;
	}


	/**
	 * @return 건강정보 등록 기본 정보
	 */
	public HealthInfoAddDefaultRO getAddHealthInfoDefaultInfo() {

		HealthInfoAddDefaultRO item = new HealthInfoAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		
		return item;
	}

	/**
	 * @param healthInfo 건강 정보
	 * @return 수정을 위한 기본 정보
	 */
	public HealthInfoAddDefaultRO getEditHealthInfoDefaultInfo(HealthInfoTestEditRO healthInfo){
		HealthInfoAddDefaultRO item = this.getAddHealthInfoDefaultInfo();
		item.setMaxPrintOrder(this.findMaxPrintOrderByLangCode(healthInfo.getCodeLangType()));
		return item;
	}
	
	

	/**
	 * @param langCode 언어코드
	 * @return 언어코드에 해당하는 최대 출력 값
	 */
	public int findMaxPrintOrderByLangCode(final String langCode) {
		return mapper.findMaxPrintOrderByLangCode(langCode);
	}


	/**
	 * @param param 등록 정보
	 * @param thumFile 섬네일 파일
	 * @param contentFile 내용 파일
	 * @param req req
	 * @return 건강 정보 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int addHealthInfo(final HealthInfoAddPO param, final MultipartFile thumFile, final MultipartFile contentFile,
			final HttpServletRequest req) throws IOException, InterruptedException {

		final String regUserId = SessionUtil.getAuthUserId();
		
		HealthInfoVO item = new HealthInfoVO();
		item.setCodeLangType(param.getCodeLang());
		
		//파일들 처리
//		item.setImgTitleThumPath(fileComponent.writeImageThumFile(FILE_PATH, thumFile, 161, 85));
		item.setImgTitleThumPath(fileComponent.writeFile(FILE_PATH, thumFile));
		item.setImgTitleThumName(thumFile.getOriginalFilename());
		item.setImgContentPath(fileComponent.writeFile(FILE_PATH, contentFile));
		item.setImgContentName(contentFile.getOriginalFilename());
		
		item.setTitle(param.getTitle());
		item.setSubTitle(param.getSubTitle());
		item.setWriter(param.getWriter());
		item.setInspector(param.getInspector());
		item.setInspectorCmt(param.getInspectorCmt());
		item.setPrintOrder(param.getPrintOrder());
		item.setPrintFlag(param.getPrintFlag());
		item.setRegUserId(regUserId);
		
		this.updateHealthInfoOrder(item.getPrintOrder(), item.getCodeLangType(), true, req);
		
		mapper.addHealthInfo(item);
		
		HealthInfoVO addData = mapper.findHealthInfoBySeq(item.getSeq());
		
		logEditService.insertAddLog(req, addData);
		
		
		Gson gson = new Gson();
		Type sourceListType = new TypeToken<List<HealthInfoSourceVO>>() {
		}.getType();
		
		List<HealthInfoSourceVO> sourceList = gson.fromJson(param.getSourceJSON(), sourceListType);
		sourceList.forEach(sItem ->{
			sItem.setHealthInfoSeq(item.getSeq());
			sItem.setRegUserId(regUserId);
		});
		
		mapper.addHealthSource(sourceList);
		
		List<HealthInfoSourceVO> addSourceData = mapper.findHealthSourceByHealthSeq(item.getSeq());
		
		logEditService.insertAddLog(req, addSourceData);
		
		Type testListType = new TypeToken<List<HealinfoTestPO>>() {
		}.getType();
		
		List<HealinfoTestPO> testList = gson.fromJson(param.getTestJSON(), testListType);
		
//		//수기 입력된 리스트
//		List<HealinfoTestPO> hardTestList = testList.stream().filter(t -> {return t.getHardFlag().equals("Y");}).collect(Collectors.toList());
//		//검색해서 선택된 리스트
//		List<HealinfoTestPO> searchTestList = testList.stream().filter(t -> {return !t.getHardFlag().equals("Y");}).collect(Collectors.toList());


		int paddingSecond = 0;
		for (HealinfoTestPO tItem : testList) {
			if(tItem.getHardFlag().equals("Y")){
				tItem.setHealthInfoSeq(item.getSeq());
				tItem.setRegUserId(regUserId);
				tItem.setPaddingSecond(paddingSecond);

				mapper.addHealthTestHardInfoOne(tItem);

			}else{
				HealthInfoTestCodeVO data = new HealthInfoTestCodeVO();
				data.setTestCode(tItem.getTestCode());
				data.setHealthInfoSeq(item.getSeq());
				data.setTestName(tItem.getTestName());
				data.setComment(tItem.getComment());
				data.setRegUserId(regUserId);
				data.setPaddingSecond(paddingSecond);
				mapper.addHealthTestSearchInfoOne(data);

			}
			//regdate 나누기 위한 작업
//			TimeUnit.SECONDS.sleep(1);
			paddingSecond++;

		}
		List<HealthInfoTestHardInfoVO> addHardTestData = mapper.findHealthHardTestByHealthSeq(item.getSeq());
		logEditService.insertAddLog(req, addHardTestData);
		List<HealthInfoTestCodeVO> addSearchTestData = mapper.findHealthSearchTestByHealthSeq(item.getSeq());
		logEditService.insertAddLog(req, addSearchTestData);


		
//		if(hardTestList != null && hardTestList.size() > 0){
//
//			hardTestList.forEach(tItem ->{
//				tItem.setHealthInfoSeq(item.getSeq());
//				tItem.setRegUserId(regUserId);
//			});
//
//			mapper.addHealthTestHardInfo(hardTestList);
//
//			List<HealthInfoTestHardInfoVO> addHardTestData = mapper.findHealthHardTestByHealthSeq(item.getSeq());
//
//			logEditService.insertAddLog(req, addHardTestData);
//		}
//
//		if(searchTestList != null & searchTestList.size() > 0){
//
//			List<HealthInfoTestCodeVO> searchDataList = new ArrayList<>();
//
//			searchTestList.forEach(t ->{
//				HealthInfoTestCodeVO data = new HealthInfoTestCodeVO();
//				data.setTestCode(t.getTestCode());
//				data.setHealthInfoSeq(item.getSeq());
//				data.setTestName(t.getTestName());
//				data.setComment(t.getComment());
//				data.setRegUserId(regUserId);;
//				searchDataList.add(data);
//			});
//
//			mapper.addHealthTestSearchInfo(searchDataList);
//
//			List<HealthInfoTestCodeVO> addSearchTestData = mapper.findHealthSearchTestByHealthSeq(item.getSeq());
//			logEditService.insertAddLog(req, addSearchTestData);
//
//		}
		adminUtilService.reloadServer();
		return item.getSeq();
	}


	/**
	 * @param seq 식별자
	 * @return 수정용 정보
	 * @throws IOException io 에러
	 */
	public HealthInfoTestEditRO findHealthInfoEditInfo(final int seq, final HttpServletRequest req) throws IOException {
		
		HealthInfoTestEditRO result = mapper.findHealthInfoEditBySeq(seq);
		
		result.setSources(mapper.findHealthSourceViewByHealthSeq(seq));
		result.setTestEditList(mapper.findHealthTestEditByHealthSeq(seq).stream().sorted().collect(Collectors.toList()));
		
//		result.getTestEditList().stream().
//		filter(item -> { return item.getHardFlag().equals("N");}).
//		forEach(item -> {
//			item.setTestName(inspectionTestService.getTestName(item.getTestCode(), req));
//		});
		
		if(result.getImgThumFlag().equals("Y")){
			result.setImgTitleThumBase64(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getImgTitleThumPath()));
		}
		if(result.getImgContentFlag().equals("Y")){
			result.setImgContentBase64(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getImgContentPath()));
		}
	
		
		return result;
		
	}


	/**
	 * @param param 수정 되는 정보
	 * @param thumFile 섬네일
	 * @param contentFile 내용 파일
	 * @param req req
	 * @return 성공 여부
	 * @throws IOException ioe
	 * @throws InterruptedException 
	 */
	public boolean editHealthInfo(final HealthInfoEditPO param, final MultipartFile[] thumFile, final MultipartFile[] contentFile,
			final HttpServletRequest req) throws IOException, InterruptedException {
		
		HealthInfoVO beforeData = mapper.findHealthInfoBySeq(param.getSeq());
		List<HealthInfoSourceVO> beforeSourceData = mapper.findHealthSourceByHealthSeq(param.getSeq());
		List<HealthInfoTestHardInfoVO> beforeHardTestData = mapper.findHealthHardTestByHealthSeq(param.getSeq());
		List<HealthInfoTestCodeVO> beforeSearchTestData = mapper.findHealthSearchTestByHealthSeq(param.getSeq());
		
		if(!beforeData.getCodeLangType().equals(param.getCodeLang()) || beforeData.getPrintOrder() != param.getPrintOrder()){
			//언어 코드가 변경 되거나 출력 순서가 변경된 경우
			this.updateHealthInfoOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), false, req);
			this.updateHealthInfoOrder(param.getPrintOrder(), param.getCodeLang(), true, req);
		}
		
		
		final String editUserId = SessionUtil.getAuthUserId();
		
		HealthInfoVO item = new HealthInfoVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		
		//파일들 처리
		if(thumFile.length > 0){
			item.setImgTitleThumPath(fileComponent.writeFile(FILE_PATH, thumFile[0]));
//			item.setImgTitleThumPath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 161, 85));
			item.setImgTitleThumName(thumFile[0].getOriginalFilename());
		}else{
			item.setImgTitleThumPath(beforeData.getImgTitleThumPath());
			item.setImgTitleThumName(beforeData.getImgTitleThumName());
		}
		
		if(contentFile.length > 0){
			item.setImgContentPath(fileComponent.writeFile(FILE_PATH, contentFile[0]));
			item.setImgContentName(contentFile[0].getOriginalFilename());
		}else{
			item.setImgContentPath(beforeData.getImgContentPath());
			item.setImgContentName(beforeData.getImgContentName());
		}
		
		item.setTitle(param.getTitle());
		item.setSubTitle(param.getSubTitle());
		item.setWriter(param.getWriter());
		item.setInspector(param.getInspector());
		item.setInspectorCmt(param.getInspectorCmt());
		item.setPrintOrder(param.getPrintOrder());
		item.setPrintFlag(param.getPrintFlag());
		item.setEditUserId(editUserId);
		
		mapper.editHealthInfo(item);
		
		Gson gson = new Gson();
		Type sourceListType = new TypeToken<List<HealthInfoSourceEditPO>>() {
		}.getType();
		
		List<HealthInfoSourceEditPO> sourceList = gson.fromJson(param.getSourceJSON(), sourceListType);
		//건강정보 출처 수정된 내역 처리
		List<HealthInfoSourceEditPO> sourceEditList = sourceList.stream().filter(s -> {return StringUtils.isNotEmpty(s.getEditFlag()) && s.getEditFlag().equals("Y");}).collect(Collectors.toList());
		
		if(sourceEditList.size() > 0){
		
			for(HealthInfoSourceEditPO editSource :sourceEditList){
				editSource.setEditUserID(editUserId);
				mapper.editHealthSource(editSource);
			}
		}
		
		//건강정보 출처 신규 입력된 내용 처리
		List<HealthInfoSourceEditPO> sourceAddList = sourceList.stream().filter(s -> {return s.getSeq() == 0;}).collect(Collectors.toList());
		
		if(sourceAddList.size() > 0){
		
			List<HealthInfoSourceVO> sourceAdds = new ArrayList<HealthInfoSourceVO>();
			
			sourceAddList.forEach(s ->{
				HealthInfoSourceVO sItem = new HealthInfoSourceVO();
				sItem.setSource(s.getSource());
				sItem.setComment(s.getComment());
				sItem.setUrl(s.getUrl());
				sItem.setHealthInfoSeq(item.getSeq());
				sItem.setRegUserId(editUserId);
				sourceAdds.add(sItem);
			});
			
			mapper.addHealthSource(sourceAdds);
		}
		
		//건강정보 삭제된 내역 처리
		Type deleteSeqListType = new TypeToken<List<Integer>>() {
		}.getType();
		
		List<Integer> deleteSourceSeqs = gson.fromJson(param.getSourceDeleteJSON(), deleteSeqListType);
		
		HealthinfoCommonDeletePO sourceDeletePO = new HealthinfoCommonDeletePO();
		
		if(deleteSourceSeqs.size() > 0){
		
			sourceDeletePO.setHardInfoSeq(item.getSeq());
			sourceDeletePO.setDeleteSeqs(deleteSourceSeqs);
			sourceDeletePO.setEditUserId(editUserId);
			
			mapper.deleteHealthSource(sourceDeletePO);
		}
		
		
		//검사 테스트 관련
		Type testListType = new TypeToken<List<HealinfoTestEditPO>>() {
		}.getType();
		
		List<HealinfoTestEditPO> testList = gson.fromJson(param.getTestJSON(), testListType);
		
		//수기 입력된 수정된 리스트
		List<HealinfoTestEditPO> hardEditTestList = testList.stream().filter(t -> {return t.getSeq() > 0 && StringUtils.isNotEmpty(t.getEditFlag()) && t.getHardFlag().equals("Y") && t.getEditFlag().equals("Y");}).collect(Collectors.toList());
		
		if(hardEditTestList != null && hardEditTestList.size() > 0){
			for(HealinfoTestEditPO editTest :hardEditTestList){
				editTest.setEditUserId(editUserId);
				mapper.editHealthHardTest(editTest);
			}
		}
		
		//검색 입력된 수정된 리스트
		List<HealinfoTestEditPO> searchEditTestList = testList.stream().filter(t -> {return t.getSeq() > 0 && StringUtils.isNotEmpty(t.getEditFlag()) && !t.getHardFlag().equals("Y") && t.getEditFlag().equals("Y");}).collect(Collectors.toList());
		if(searchEditTestList != null && searchEditTestList.size() > 0){
			for(HealinfoTestEditPO editTest :searchEditTestList){
				editTest.setEditUserId(editUserId);
				mapper.editHealthSearchTest(editTest);
			}
		}

		List<HealinfoTestEditPO> addTestList = testList.stream().filter(t -> {return t.getSeq() == 0;}).collect(Collectors.toList());

		int paddingTime = 0;
		for (HealinfoTestEditPO t : addTestList) {
			if(t.getHardFlag().equals("Y")){
				HealinfoTestPO sItem = new HealinfoTestPO();
				sItem.setTestCode(t.getTestCode());
				sItem.setTestName(t.getTestName());
				sItem.setComment(t.getComment());
				sItem.setSpecimen(t.getSpecimen());
				sItem.setVolume(t.getVolume());
				sItem.setTestMethod(t.getTestMethod());
				sItem.setTestDay(t.getTestDay());
				sItem.setProcessDay(t.getProcessDay());

				sItem.setHealthInfoSeq(item.getSeq());
				sItem.setRegUserId(editUserId);
				sItem.setPaddingSecond(paddingTime);

				mapper.addHealthTestHardInfoOne(sItem);
			}else{

				HealthInfoTestCodeVO data = new HealthInfoTestCodeVO();
				data.setTestCode(t.getTestCode());
				data.setTestName(t.getTestName());
				data.setHealthInfoSeq(item.getSeq());
				data.setComment(t.getComment());
				data.setRegUserId(editUserId);
				data.setPaddingSecond(paddingTime);

				mapper.addHealthTestSearchInfoOne(data);

			}
			paddingTime++;
		}

		//추가 수기 입력된 리스트
//		List<HealinfoTestEditPO> hardAddTestList = testList.stream().filter(t -> {return t.getHardFlag().equals("Y") && t.getSeq() == 0;}).collect(Collectors.toList());
//
//		if(hardAddTestList.size() > 0){
//			List<HealinfoTestPO> hardAdds = new ArrayList<HealinfoTestPO>();
//
//			hardAddTestList.forEach(t ->{
//				HealinfoTestPO sItem = new HealinfoTestPO();
//				sItem.setTestCode(t.getTestCode());
//				sItem.setTestName(t.getTestName());
//				sItem.setComment(t.getComment());
//				sItem.setSpecimen(t.getSpecimen());
//				sItem.setVolume(t.getVolume());
//				sItem.setTestMethod(t.getTestMethod());
//				sItem.setTestDay(t.getTestDay());
//				sItem.setProcessDay(t.getProcessDay());
//
//				sItem.setHealthInfoSeq(item.getSeq());
//				sItem.setRegUserId(editUserId);
//				hardAdds.add(sItem);
//			});
//
//			mapper.addHealthTestHardInfo(hardAdds);
//		}
//
//		//추가 검색 입력된 리스트
//		List<HealinfoTestEditPO> searchAddTestList = testList.stream().filter(t -> {return !t.getHardFlag().equals("Y") && t.getSeq() == 0;}).collect(Collectors.toList());
//
//		if(searchAddTestList.size() > 0){
//
//			List<HealthInfoTestCodeVO> searchDataList = new ArrayList<>();
//
//			searchAddTestList.forEach(t ->{
//				HealthInfoTestCodeVO data = new HealthInfoTestCodeVO();
//				data.setTestCode(t.getTestCode());
//				data.setTestName(t.getTestName());
//				data.setHealthInfoSeq(item.getSeq());
//				data.setComment(t.getComment());
//				data.setRegUserId(editUserId);
//				searchDataList.add(data);
//			});
//
//			mapper.addHealthTestSearchInfo(searchDataList);
//
//		}
		
		List<Integer> deleteHardSeqs = gson.fromJson(param.getTestDeleteJSON(), deleteSeqListType);
		
		if(deleteHardSeqs.size() > 0){
			sourceDeletePO = new HealthinfoCommonDeletePO();
			
			sourceDeletePO.setHardInfoSeq(item.getSeq());
			sourceDeletePO.setDeleteSeqs(deleteHardSeqs);
			sourceDeletePO.setEditUserId(editUserId);
			
			mapper.deleteHealthHardTest(sourceDeletePO);
		}
		
		List<Integer> deleteSearchSeqs = gson.fromJson(param.getTestSearchDeleteJSON(), deleteSeqListType);
		
		if(deleteSearchSeqs.size() > 0){
			sourceDeletePO = new HealthinfoCommonDeletePO();
			
			sourceDeletePO.setHardInfoSeq(item.getSeq());
			sourceDeletePO.setDeleteSeqs(deleteSearchSeqs);
			sourceDeletePO.setEditUserId(editUserId);
			
			mapper.deleteHealthSearchTest(sourceDeletePO);
		}
		
		
		HealthInfoVO afterData = mapper.findHealthInfoBySeq(param.getSeq());
		List<HealthInfoSourceVO> afterSourceData = mapper.findHealthSourceByHealthSeq(param.getSeq());
		List<HealthInfoTestHardInfoVO> afterHardTestData = mapper.findHealthHardTestByHealthSeq(param.getSeq());
		List<HealthInfoTestCodeVO> afterSearchTestData = mapper.findHealthSearchTestByHealthSeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		logEditService.insertEditLog(req, beforeSourceData, afterSourceData);
		logEditService.insertEditLog(req, beforeHardTestData, afterHardTestData);
		logEditService.insertEditLog(req, beforeSearchTestData, afterSearchTestData);
		adminUtilService.reloadServer();
		return true;
	}


	/** 
	 * 
	 * @param keyword 검색 키워드
	 * @param req 
	 * @return 검사항목 리스트
	 */
	public List<MWT001R1ListRO> searchTestCode(final String keyword, final HttpServletRequest req) {
		
		InspectionTestSearchOption param = new InspectionTestSearchOption();
		param.setSearchKeyword(keyword);

		List<MWT001R1ListRO> resultList = inspectionTestService.findInspectionTestList(param, req);
		
		return resultList;
	}


	
}
