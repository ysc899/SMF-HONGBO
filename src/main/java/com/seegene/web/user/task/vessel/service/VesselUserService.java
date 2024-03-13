package com.seegene.web.user.task.vessel.service;

import java.io.File;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.inspection.vessel.vo.VesselVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.repository.mariadb.InspectionVesselMapper;
import com.seegene.web.user.task.vessel.vo.VesselUserAllListRO;
import com.seegene.web.user.task.vessel.vo.VesselUserListRO;
import com.seegene.web.user.task.vessel.vo.VesselUserNextPreRO;
import com.seegene.web.user.task.vessel.vo.VesselUserViewRO;

@Service
public class VesselUserService {
	@Autowired
	private InspectionVesselMapper mapper;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "vessel";
	
	
	public List<VesselUserAllListRO> findAllList(final Locale locale){
		
		return mapper.findUserAllVesselList(locale.getLanguage());
		
	}


	public CommonListReuslt<VesselUserListRO> findVesselMoreList(final UserSearchPaggingCommonPO param, final Locale locale) {
		param.setLimit(12);
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		
		List<VesselUserListRO> list = mapper.findUserVesselList(param);
		
		list.forEach(t ->{
			try{
				t.setFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+t.getFilePath()));
			}catch(Exception e){
				t.setFileContent("");
			}
			
			t.setFilePath("");
		});
		
		int count = mapper.findUserVesselListCount(param);
		
		CommonListReuslt<VesselUserListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}
	
	
	public CommonListReuslt<VesselUserListRO> findMainSearchVesselList(final UserSearchPaggingCommonPO param, final Locale locale) {
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		
		List<VesselUserListRO> list = mapper.findUserVesselList(param);
		
		list.forEach(t ->{
			try{
				t.setFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+t.getFilePath()));
			}catch(Exception e){
				t.setFileContent("");
			}
			
			t.setFilePath("");
		});
		
		int count = mapper.findUserVesselListCount(param);
		
		CommonListReuslt<VesselUserListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}


	public VesselUserViewRO findVesselViewInfo(final int seq, final Locale locale) {

		VesselVO param = new VesselVO();
		param.setSeq(seq);
		param.setCodeLangType(locale.getLanguage());
		
		VesselUserViewRO result = mapper.findUserVesselViewBySeq(param);
		
		if(result != null){
			try{
				result.setFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+result.getFilePath()));
			}catch(Exception e){
				result.setFileContent("");
			}
			result.setFilePath("");
			
			List<VesselUserNextPreRO> nextPre = mapper.findUserVesselNextPreBySeq(param);
			
			VesselUserNextPreRO nextRO = nextPre.stream().filter(t -> {return t.getType().equals("next");}).findFirst().orElse(null);
			
			if(nextRO != null){
				result.setNextSeq(nextRO.getSeq());
			}else{
				result.setNextSeq(0);
			}
			VesselUserNextPreRO preRO = nextPre.stream().filter(t -> {return t.getType().equals("pre");}).findFirst().orElse(null);
			if(preRO != null){
				result.setPreSeq(preRO.getSeq());
			}else{
				result.setPreSeq(0);
			}
		}
		
		return result;
	}
}

