package com.seegene.web.admin.status.network.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
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
import com.seegene.web.admin.status.network.vo.NetworkAddDefaultRO;
import com.seegene.web.admin.status.network.vo.NetworkAddPO;
import com.seegene.web.admin.status.network.vo.NetworkEditPO;
import com.seegene.web.admin.status.network.vo.NetworkListRO;
import com.seegene.web.admin.status.network.vo.NetworkMappingVO;
import com.seegene.web.admin.status.network.vo.NetworkStaffsInfoVO;
import com.seegene.web.admin.status.network.vo.NetworkStaffsVO;
import com.seegene.web.admin.status.network.vo.NetworkViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.NetworkMapper;

/**
 * 전국 네트워크 서비스
 */
@Service
@Transactional
public class NetworkService {
	
	@Autowired
	private NetworkMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FilE_PATH = "network";
	
	private NetworkStaffsVO findNetworkStaffsBySeq(final int seq){
		return mapper.findNetworkStaffsBySeq(seq);
	}
	private List<NetworkStaffsInfoVO> findNetworkStaffsInfoByStaffsSeq(final int staffsSeq){
		return mapper.findNetworkStaffsInfoByStaffsSeq(staffsSeq);
	}
	private List<NetworkMappingVO> findMappingByStaffsSeq(final int staffsSeq){
		return mapper.findMappingByStaffsSeq(staffsSeq);
	}

	/**
	 * @param param 검색조건
	 * @return 전국 네트워크 리스트
	 */
	public CommonListReuslt<NetworkListRO> findNetworkList(final SearchPaggingCommonPO param) {
		param.setMybatisPagging();
		
		List<NetworkListRO> list = mapper.findNetworkList(param);
		int count = mapper.countNetworkList(param);
		
		CommonListReuslt<NetworkListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 맵핑 seq
	 * @return 전국 네트워크 상세 정보 조회
	 * @throws IOException 
	 */
	public NetworkViewRO findNetworkList(final int seq) throws IOException {
		
		NetworkViewRO result = mapper.findNetworkViewByMappingSeq(seq);
		
		if(result == null){
			return null;
		}
		
		if(StringUtils.isNotEmpty(result.getImagePath())){
			result.setImageContent(fileComponent.getImageToBase64(FilE_PATH+File.separator + result.getImagePath()));
		}
		result.setLocInfos(mapper.findNetworkLocViewByStaffsSeq(result.getSeq()));
		result.setStaffsInfos(mapper.findNetworkStaffInfoViewByStaffsSeq(result.getSeq()));
		return result;
	}
	
	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateNetworkMappingOrder(final NetworkMappingVO item,  final boolean incFlag, final HttpServletRequest req){
		
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<NetworkMappingVO> beforeData = mapper.checkNetworkOrder(item);
		
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateNetworkOrderInc(item);
			}else{
				mapper.updateNetworkOrderDec(item);
			}
			
			List<NetworkMappingVO> afterData = mapper.checkNetworkOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
	}

	/**
	 * @param seq 삭제될 담당자 seq
	 * @param req req
	 * @return 삭제 성공 여부
	 */
	public boolean deleteNetworkStaffs(final int seq, final HttpServletRequest req) {
		
		NetworkStaffsVO beforeData = this.findNetworkStaffsBySeq(seq);
		
		NetworkStaffsVO item = new NetworkStaffsVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteNetworkStaffs(item);
		
		NetworkStaffsVO afterData = this.findNetworkStaffsBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		List<NetworkMappingVO> locList = mapper.findDeleteNetworkStaffsMappingInfo(seq);
		
		locList.forEach(t ->{
			this.updateNetworkMappingOrder(t, false, req);
		});
		
		return true;
	}

	/**
	 * @return 전국 네트워크 등록 기본 정보
	 */
	public NetworkAddDefaultRO getAddNetworkDefaultInfo() {
		NetworkAddDefaultRO item  = new NetworkAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setLocCount(mapper.getLocPrintOrder());
		return item;
	}

	/**
	 * @param param 네트워크 사용자 등록 정보
	 * @param thumFile 섬네일 파일
	 * @param req req
	 * @return 상세 페이지 seq
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int addNetwork(final NetworkAddPO param, final MultipartFile[] thumFile, final HttpServletRequest req) throws IOException, InterruptedException {
		
		String regUserId = SessionUtil.getAuthUserId();
		
		Gson gson = new Gson();
		
		Type staffsInfoType = new TypeToken<List<NetworkStaffsInfoVO>>() {
		}.getType();
		Type staffsMappingType = new TypeToken<List<NetworkMappingVO>>() {
		}.getType();
		
		List<NetworkStaffsInfoVO> staffsInfoList = gson.fromJson(param.getUserInfoJSON(), staffsInfoType);
		List<NetworkMappingVO> staffsMappingList = gson.fromJson(param.getLocInfoJSON(), staffsMappingType);
		
		String tempName = staffsInfoList.stream().filter(t -> {return t.getCodeLangType().equals("ko");}).findFirst().orElse(null).getName();
		
		
		NetworkStaffsVO item = new NetworkStaffsVO();
		item.setName(tempName);
		item.setDirectorFlag(param.getDirectorFlag());
		item.setEmail(param.getEmail());
		
		if(item.getDirectorFlag().equals("Y")){
			if(thumFile.length > 0 ){
				item.setImagePath(fileComponent.writeImageThumFile(FilE_PATH, thumFile[0], 104, 104));
			}
		}
		
		item.setRegUserId(regUserId);
		
		mapper.addNetworkStaffs(item);
		
		staffsInfoList.forEach(t ->{
			t.setNetworkStaffsSeq(item.getSeq());
			t.setRegUserId(regUserId);
		});
		mapper.addNetworkStaffsInfos(staffsInfoList);
		
		staffsMappingList.forEach(t ->{
			t.setNetworkStaffsSeq(item.getSeq());
			t.setRegUserId(regUserId);
			
			this.updateNetworkMappingOrder(t, true, req);
		});
		
		mapper.addNetworkMapping(staffsMappingList);
		
		NetworkStaffsVO afterData = this.findNetworkStaffsBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		List<NetworkStaffsInfoVO> afterInfoData = this.findNetworkStaffsInfoByStaffsSeq(item.getSeq());
		logEditService.insertAddLog(req, afterInfoData);
		List<NetworkMappingVO> afterMappingData = this.findMappingByStaffsSeq(item.getSeq());
		logEditService.insertAddLog(req, afterMappingData);
		
		return afterMappingData.get(0).getSeq();
	}
	
	/**
	 * @param param 수정정보
	 * @param thumFile 파일정보
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws IOException 
	 * @throws InterruptedException 
	 */
	public int editNetwork(final NetworkEditPO param, final MultipartFile[] thumFile, final HttpServletRequest req) throws IOException, InterruptedException {
		
		String editUserId = SessionUtil.getAuthUserId();
		
		NetworkStaffsVO beforeData = this.findNetworkStaffsBySeq(param.getSeq());
		
		if(!beforeData.getEmail().equals(param.getEmail()) 
			|| !beforeData.getDirectorFlag().equals(param.getDirectorFlag()) 
			|| thumFile.length > 0){
			
			NetworkStaffsVO editData = new NetworkStaffsVO();
			editData.setSeq(param.getSeq());
			editData.setEmail(param.getEmail());
			editData.setDirectorFlag(param.getDirectorFlag());

			if(thumFile.length > 0){
				editData.setImagePath(fileComponent.writeImageThumFile(FilE_PATH, thumFile[0], 104, 104));
			}else{
				editData.setImagePath(beforeData.getImagePath());
			}
			
			editData.setEditUserId(editUserId);
			
			mapper.editNetworkStaffs(editData);
			
			NetworkStaffsVO afterData = this.findNetworkStaffsBySeq(param.getSeq());
			
			logEditService.insertEditLog(req, beforeData, afterData);
		}
		//사용자 기본 정보 수정 끝
			
		
		Gson gson = new Gson();
		
		Type staffsInfoType = new TypeToken<List<NetworkStaffsInfoVO>>() {
		}.getType();
		Type staffsMappingType = new TypeToken<List<NetworkMappingVO>>() {
		}.getType();
		Type staffsMappingDeleteType = new TypeToken<List<Integer>>() {
		}.getType();
		
		List<NetworkStaffsInfoVO> staffsInfoList = gson.fromJson(param.getUserInfoJSON(), staffsInfoType);
		List<NetworkMappingVO> staffsMappingList = gson.fromJson(param.getLocInfoJSON(), staffsMappingType);
		List<Integer> mappingDeleteSeqs = gson.fromJson(param.getLocDeleteJSON(), staffsMappingDeleteType);
		
		
		List<NetworkStaffsInfoVO> beforeStaffsInfo = mapper.findNetworkStaffsInfoByStaffsSeq(beforeData.getSeq());
		
		//언어별 사용자 정보 시작
		//신규 언어 추가
		List<NetworkStaffsInfoVO> newStaffsInfos = staffsInfoList.stream().filter(t -> {return t.getSeq() == 0;}).collect(Collectors.toList());
		if(newStaffsInfos != null && newStaffsInfos.size() > 0){
			newStaffsInfos.forEach(t ->{
				t.setNetworkStaffsSeq(beforeData.getSeq());
				t.setRegUserId(editUserId);
			});
			mapper.addNetworkStaffsInfos(newStaffsInfos);
		}
		
		//기존 사용자 정보 데이터 수정
		List<NetworkStaffsInfoVO> editStaffsInfos = staffsInfoList.stream().filter(t -> {return t.getSeq() > 0;}).collect(Collectors.toList());
		editStaffsInfos.forEach(t ->{
			t.setEditUserId(editUserId);
			t.setNetworkStaffsSeq(beforeData.getSeq());
			
			mapper.editNetworkStaffsInfo(t);
		});
		
		List<NetworkStaffsInfoVO> afterStaffsInfo = mapper.findNetworkStaffsInfoByStaffsSeq(beforeData.getSeq());
		
		logEditService.insertEditLog(req, beforeStaffsInfo, afterStaffsInfo);
		
		
		List<NetworkMappingVO> beforeMapping = mapper.findMappingByStaffsSeq(param.getSeq());
		//삭제된 맵핑 정보 처리
		if(mappingDeleteSeqs != null && mappingDeleteSeqs.size() > 0){
			List<NetworkMappingVO> deleteMappingList = beforeMapping.stream().filter(t -> {return mappingDeleteSeqs.contains(t.getSeq());}).collect(Collectors.toList());
			deleteMappingList.forEach(t ->{
				this.updateNetworkMappingOrder(t, false, req);
				mapper.deleteNetworkMapping(t);
			});
		}
		
		//신규처리
		List<NetworkMappingVO> newMapping = staffsMappingList.stream().filter(t ->{return t.getSeq() == 0;}).collect(Collectors.toList());
		if(newMapping != null && newMapping.size() > 0){
			newMapping.forEach(t ->{
				t.setNetworkStaffsSeq(beforeData.getSeq());
				t.setRegUserId(editUserId);
				
				this.updateNetworkMappingOrder(t, true, req);
			});
			mapper.addNetworkMapping(newMapping);
		}
		
		
		//수정 된것 처리
		List<NetworkMappingVO> editMapping = staffsMappingList.stream().filter(t ->{return t.getSeq() > 0;}).collect(Collectors.toList());
		editMapping.forEach(t ->{
			
			NetworkMappingVO beforeMappingData = beforeMapping.stream().filter(bt -> {return bt.getSeq() == t.getSeq();}).findFirst().orElse(null);
			
			if(beforeMappingData != null){
				if(beforeMappingData.getPrintOrder() != t.getPrintOrder()){
					//순서가 변경된 경우
					beforeMappingData.setEditUserId(editUserId);
					t.setEditUserId(editUserId);
					this.updateNetworkMappingOrder(beforeMappingData, false, req);
					this.updateNetworkMappingOrder(t, true, req);
				}
			}
		});
		
		List<NetworkMappingVO> afterMapping = mapper.findMappingByStaffsSeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeMapping, afterMapping);
		
		return afterMapping.stream().filter(t -> {return t.getDeleteFlag().equals("N");}).findFirst().orElse(null).getSeq();
	}
}

