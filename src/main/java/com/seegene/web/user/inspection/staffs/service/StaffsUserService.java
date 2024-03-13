package com.seegene.web.user.inspection.staffs.service;



import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.seegene.web.admin.status.staffs.vo.StaffsInfoVO;
import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.StaffsMapper;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.inspection.staffs.vo.StaffsDefaultRO;
import com.seegene.web.user.inspection.staffs.vo.StaffsUserHistoryListRO;
import com.seegene.web.user.inspection.staffs.vo.StaffsUserListRO;
import com.seegene.web.user.inspection.staffs.vo.StaffsUserViewRO;

@Service
public class StaffsUserService {

	@Autowired
	private StaffsMapper mapper;
	
	@Autowired
	private UserCodeService userCodeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "staffs";
	
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public StaffsDefaultRO getDefaultData(final String langCode){
		
		StaffsDefaultRO item = new StaffsDefaultRO();
		item.setCenterCodes(userCodeService.findCodeList("center", langCode));
		item.setPartCodes(userCodeService.findCodeList("staffPart", langCode));
		
		return item;
	}


	/**
	 * @param language 언어코드 
	 * @return 언어코드별 의료진 리스트
	 */
	public String getStaffsList(final String language) {
		List<StaffsUserListRO> result = mapper.findUserStaffsList(language);
		
		result.forEach(t ->{
			try {
				t.setThumImageContent(fileComponent.getImageToBase64(FILE_PATH+File.separator + t.getThumImagePath()));
			} catch (IOException e) {
				t.setThumImageContent("");
			}
			
			t.setThumImagePath("");
		});
		
		Gson gson = new Gson();
		
		return gson.toJson(result);
	}


	public StaffsUserViewRO findStaffsViewInfo(final int seq, final Locale locale) {

		StaffsInfoVO param = new StaffsInfoVO();
		param.setStaffsSeq(seq);
		param.setCodeLangType(locale.getLanguage());
		
		StaffsUserViewRO result = mapper.findUserStaffsViewBySeq(param);
		if(result != null){
			
			try {
				result.setImageContent(fileComponent.getImageToBase64(FILE_PATH+File.separator + result.getImagePath()));
			} catch (IOException e) {
				result.setImageContent("");
			}
			
			result.setImagePath("");
			
			
			List<StaffsUserHistoryListRO> historyList = mapper.findUserStaffsHistoryViewByStaffsSeq(param);
			
			result.setNowHistory(historyList.stream().filter(t->{return t.getNowFlag().equals("Y");}).sorted().collect(Collectors.toList()));
			result.setBeforeHistory(historyList.stream().filter(t->{return t.getNowFlag().equals("N");}).sorted().collect(Collectors.toList()));
			
		}
		
		return result;
	}
}

