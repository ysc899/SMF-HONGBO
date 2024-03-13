package com.seegene.web.user.business.clinical.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.NetworkMapper;
import com.seegene.web.user.business.clinical.vo.BusinessClinicalDefaultRO;
import com.seegene.web.user.business.clinical.vo.BusinessClinicalNetworkListRO;
import com.seegene.web.user.business.clinical.vo.NetworkSearchPO;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.menu.service.UserMenuService;

@Service
public class BusinessClinicalService {
	
	@Autowired
	private UserMenuService userMenuService;
	
	@Autowired
	private UserCodeService codeService;
	
	@Autowired
	private NetworkMapper mapper;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FilE_PATH = "network";
	

	public BusinessClinicalDefaultRO getDefaultData(String language) {
		
		BusinessClinicalDefaultRO result = new BusinessClinicalDefaultRO();
		
		result.setTabMenus(userMenuService.getChildMenus(language, "/business/clinical/index.do"));
		result.setLocCodes(codeService.findCodeList("networkLoc", language));

		return result;
	}


	public List<BusinessClinicalNetworkListRO> findNetworkInfo(final NetworkSearchPO param, final Locale locale) {
		param.setCodeLangType(locale.getLanguage());
		
		List<BusinessClinicalNetworkListRO> result = mapper.findUserNetworkList(param);
		result.forEach(t ->{
			if(StringUtils.isNotEmpty(t.getImagePath()) && t.getDirectorFlag().equals("Y")){
				try {
					t.setImageContent(fileComponent.getImageToBase64(FilE_PATH + File.separator + t.getImagePath()));
				} catch (IOException e) {
					t.setImageContent("");
				}
				t.setImagePath("");
			}
		});
		
		return result;
	}
}

