package com.seegene.web.admin.code.service;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.seegene.web.admin.code.vo.CodeEditPO;
import com.seegene.web.admin.code.vo.CodeEditSlaveInfoPO;
import com.seegene.web.admin.code.vo.CodeEditSlavePO;
import com.seegene.web.admin.code.vo.CodeMasterListRO;
import com.seegene.web.admin.code.vo.CodeMasterVO;
import com.seegene.web.admin.code.vo.CodeMasterViewRO;
import com.seegene.web.admin.code.vo.CodeSlaveInfoRO;
import com.seegene.web.admin.code.vo.CodeSlaveInfoVO;
import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.code.vo.CodeSlaveVO;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.CodeMapper;

/**
 * 시스템 코드 서비스
 */
@Service
@Transactional
public class CodeService {

	@Autowired
	private CodeMapper mapper;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	/**
	 * @return 언어코드 리스트 리턴
	 */
	public List<CodeSlaveRO> findLangCode(){
		return this.findSlaveByMaster("lang");
	}
	
	/**
	 * TODO 추후에 메모리로 관리?
	 * 
	 * @param masterCode 부모 코드
	 * @return 자식 코드 리스트(등록 수정에 사용 하는 용)
	 */
	public List<CodeSlaveRO> findSlaveByMaster(final String masterCode){
		return mapper.findSlaveCodeByMasterCode(masterCode);
	}

	/**
	 * @param param 검색조건
	 * @return 검색조건에 해당하는 코드 마스터 리스트
	 */
	public CommonListReuslt<CodeMasterListRO> findCodeList(SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<CodeMasterListRO> list = mapper.findMasterCodeList(param);
		int count = mapper.countMasterCodeList(param);
		
		CommonListReuslt<CodeMasterListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
		
	}


	/**
	 * @param seq 마스터 코드 seq
	 * @return 마스터 코드 상세 정보
	 */
	public CodeMasterViewRO findCodeMasterInfo(final int seq) {
		
		CodeMasterViewRO item = mapper.findMasterCodeBySeq(seq);
		if(item != null){
			
			item.setSlaveList(mapper.findSlaveCodeViewByMasterCode(item.getMasterCode()));
			
		}
		
		return item;
	}

	/**
	 * @param masterCode 부모코드
	 * @param slaveCode 코드
	 * @return 하위코드 언어별 정보
	 */
	public List<CodeSlaveInfoRO> findCodeSlaveInfo(final String masterCode, final String slaveCode) {

		CodeSlaveVO code = new CodeSlaveVO();
		code.setMasterCode(masterCode);
		code.setSlaveCode(slaveCode);
		
		List<CodeSlaveInfoRO> result = mapper.findSlaveCodeInfoByCode(code);
		
		return result;
	}

	/**
	 * @param param 코드 수정 정보
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean editCode(final CodeEditPO param, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		String loginUserId = SessionUtil.getAuthUserId();
		
		CodeMasterVO beforeMasterData = mapper.findMasterBySeq(param.getSeq());
		
		if(!beforeMasterData.getMasterCodeName().equals(param.getMasterCodeName())
				|| !beforeMasterData.getMasterCodeDes().equals(param.getMasterCodeDes())){
			CodeMasterVO mItem = new CodeMasterVO();
			mItem.setSeq(param.getSeq());
			mItem.setMasterCode(param.getMasterCode());
			mItem.setMasterCodeName(param.getMasterCodeName());
			mItem.setMasterCodeDes(param.getMasterCodeDes());
			mItem.setEditUserId(loginUserId);
			
			mapper.editMasterCode(mItem);
			
			CodeMasterVO afterMasterData = mapper.findMasterBySeq(param.getSeq());
			
			logEditService.insertEditLog(req, beforeMasterData, afterMasterData);
		}
		
		//보조 코드 관련 처리 
		List<CodeSlaveVO> beforeSlaveDatas = mapper.findSlaveByMasterCode(beforeMasterData.getMasterCode());
		List<CodeSlaveInfoVO> beforeSlaveInfoDatas = mapper.findSlaveInfoByMasterCode(beforeMasterData.getMasterCode());
		
		//벌크 인설트용 코드 다국어 이름
		List<CodeSlaveInfoVO> insertSlaveInfoDatas = new ArrayList<CodeSlaveInfoVO>();
		
		Gson gson = new Gson();
		
		Type slaveCodeType = new TypeToken<List<CodeEditSlavePO>>() {
		}.getType();
		Type slaveCodeInfoType = new TypeToken<List<CodeEditSlaveInfoPO>>() {
		}.getType();
		
		List<CodeEditSlavePO> slaveInfos = gson.fromJson(param.getSlaveCodeJSON(), slaveCodeType);
		
		List<CodeEditSlavePO> editSlaveList = slaveInfos.stream().filter(t ->{return t.isEditFlag() && t.getSeq() > 0;}).collect(Collectors.toList());
		
		
		//기존 코드 수정 처리
		for(CodeEditSlavePO sParam : editSlaveList){
			
			CodeSlaveVO beforeSlaveData = beforeSlaveDatas.stream().filter(t -> {return t.getSeq() == sParam.getSeq() && t.getSlaveCode().equals(sParam.getSlaveCode());}).findFirst().orElse(null);
			if(beforeSlaveData == null){
				continue;
			}
			
			if(!beforeSlaveData.getSlaveCodeName().equals(sParam.getSlaveCodeName()) 
				|| !beforeSlaveData.getSlaveCodeDes().equals(sParam.getSlaveCodeDes()) || beforeSlaveData.getCodeOrder() != sParam.getCodeOrder()){
				
				CodeSlaveVO sItem = new CodeSlaveVO();
				sItem.setSeq(sParam.getSeq());
				sItem.setSlaveCode(sParam.getSlaveCode());
				sItem.setSlaveCodeName(sParam.getSlaveCodeName());
				sItem.setSlaveCodeDes(sParam.getSlaveCodeDes());
				sItem.setCodeOrder(sParam.getCodeOrder());
				sItem.setMasterCode(beforeMasterData.getMasterCode());
				sItem.setEditUserId(loginUserId);
				mapper.editSlaveCode(sItem);
			}
			
			List<CodeEditSlaveInfoPO> langs = gson.fromJson(sParam.getLangsJSON(), slaveCodeInfoType);
			
			if(langs != null){
				for(CodeEditSlaveInfoPO siParam : langs){
					
					CodeSlaveInfoVO beforeSlaveInfoData = beforeSlaveInfoDatas.stream()
						.filter(t->{return t.getMasterCode().equals(beforeMasterData.getMasterCode()) 
										&& t.getSlaveCode().equals(beforeSlaveData.getSlaveCode())
										&& t.getCodeLangType().equals(siParam.getCodeLangType());
								}).findFirst().orElse(null);
					
					
					if(beforeSlaveInfoData == null){
						//데이터 추가
						CodeSlaveInfoVO siItem = new CodeSlaveInfoVO();
						siItem.setMasterCode(beforeMasterData.getMasterCode());
						siItem.setSlaveCode(beforeSlaveData.getSlaveCode());
						siItem.setCodeLangType(siParam.getCodeLangType());
						siItem.setInfoName(siParam.getInfoName());
						siItem.setRegUserId(loginUserId);
						insertSlaveInfoDatas.add(siItem);
						
					}else if(!beforeSlaveInfoData.getInfoName().equals(siParam.getInfoName())){
						//데이터 갱신
						CodeSlaveInfoVO siItem = new CodeSlaveInfoVO();
						siItem.setMasterCode(beforeMasterData.getMasterCode());
						siItem.setSlaveCode(beforeSlaveData.getSlaveCode());
						siItem.setCodeLangType(siParam.getCodeLangType());
						siItem.setInfoName(siParam.getInfoName());
						
						siItem.setEditUserId(loginUserId);
						siItem.setSeq(siParam.getSeq());
						mapper.editSlaveInfo(siItem);
					}
				}
			}
		}
		
		//시스템 코드가 아닌 경우에만 데이터 추가
		if(beforeMasterData.getSystemCodeFlag().equals("N")) {
			
			List<CodeSlaveVO> insertCodeSlave = new ArrayList<>();
		
			List<CodeEditSlavePO> addSlaveList = slaveInfos.stream().filter(t ->{return t.isNewFlag() && t.getSeq() == 0;}).collect(Collectors.toList());
			
			for(CodeEditSlavePO sParam : addSlaveList){
				CodeSlaveVO sItem = new CodeSlaveVO();
				sItem.setSlaveCode(sParam.getSlaveCode());
				sItem.setSlaveCodeName(sParam.getSlaveCodeName());
				sItem.setSlaveCodeDes(sParam.getSlaveCodeDes());
				sItem.setMasterCode(beforeMasterData.getMasterCode());
				sItem.setCodeOrder(sParam.getCodeOrder());
				sItem.setRegUserId(loginUserId);
				
				insertCodeSlave.add(sItem);
				
				List<CodeEditSlaveInfoPO> langs = gson.fromJson(sParam.getLangsJSON(), slaveCodeInfoType);
				
				if(langs != null){
					for(CodeEditSlaveInfoPO siParam : langs){
						//데이터 추가
						CodeSlaveInfoVO siItem = new CodeSlaveInfoVO();
						siItem.setMasterCode(beforeMasterData.getMasterCode());
						siItem.setSlaveCode(sItem.getSlaveCode());
						siItem.setCodeLangType(siParam.getCodeLangType());
						siItem.setInfoName(siParam.getInfoName());
						siItem.setRegUserId(loginUserId);
						insertSlaveInfoDatas.add(siItem);
					}
				}
			}
			
			if(insertCodeSlave.size() > 0){
				mapper.addSlaveCodes(insertCodeSlave);
			}
		}
		
		if(insertSlaveInfoDatas.size() > 0){
			mapper.addSlaveCodeInfos(insertSlaveInfoDatas);
		}
		
		List<CodeSlaveVO> afterSlaveDatas = mapper.findSlaveByMasterCode(beforeMasterData.getMasterCode());
		List<CodeSlaveInfoVO> afterSlaveInfoDatas = mapper.findSlaveInfoByMasterCode(beforeMasterData.getMasterCode());
		
		logEditService.insertEditLog(req, beforeSlaveDatas, afterSlaveDatas);
		logEditService.insertEditLog(req, beforeSlaveInfoDatas, afterSlaveInfoDatas);
		
		adminUtilService.reloadServer();
		return true;
	}
	
}
