package com.seegene.web.user.logo.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.main.logo.vo.MainLogoUserRO;
import com.seegene.web.admin.main.logo.vo.MainLogoVO;
import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.MainLogoMapper;
import com.seegene.web.user.logo.vo.LogoRO;

@Service
public class LogoService {

	@Autowired
	private MainLogoMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "logo";
	
	private final Map<String, LogoRO> langLogos = new HashMap<>();
	
	public void initLogos(){
		langLogos.clear();
		
		List<CodeSlaveRO> langCodes = codeService.findLangCode();
		List<CodeSlaveRO> logoCodes = codeService.findSlaveByMaster("logo");
		
		langCodes.forEach(lang ->{
			LogoRO result = new LogoRO();

			logoCodes.forEach(logoType->{
				MainLogoVO param = new MainLogoVO();
				param.setCodeLangType(lang.getSlaveCode());
				param.setCodeLogoType(logoType.getSlaveCode());
				
				MainLogoUserRO logo = mapper.findMainUserLogo(param);
				
				if(logo != null){
					try {
						logo.setLogoImage(fileComponent.getImageToBase64(FILE_PATH+File.separator + logo.getFilePath()));
					} catch (IOException e) {
						logo = null;
					}
				}
				
				if(logoType.getSlaveCode().equals("left")){
					result.setLeftLogo(logo);
				}else if(logoType.getSlaveCode().equals("center")){
					result.setCenterLogo(logo);
				}
			});
			
			langLogos.put(lang.getSlaveCode(), result);
		});
	}
	
	public LogoRO getLogos(final String langCode){
		return langLogos.get(langCode);
	}
	
}
