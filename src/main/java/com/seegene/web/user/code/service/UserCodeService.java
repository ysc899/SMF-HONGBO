package com.seegene.web.user.code.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.code.vo.CodeSlaveInfoVO;
import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.code.vo.CodeSlaveVO;
import com.seegene.web.repository.mariadb.CodeMapper;
import com.seegene.web.user.code.vo.CodeRO;

@Service
public class UserCodeService {
	
	
	@Autowired
	private CodeMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	//마스터 코드 언어코드
	private final Map<String, Map<String, List<CodeRO>>> codeMap = new HashMap<>();
	
	
	public void initCodes(){
		
		codeMap.clear();
		
		List<CodeSlaveRO> langCodes = codeService.findLangCode();
		
		List<String> allMaster = mapper.findAllMasterCode();
		
		List<CodeSlaveVO> allSlave = mapper.findAllSlave();
		
		List<CodeSlaveInfoVO> allSlaveInfo = mapper.findAllSlaveInfo();
		
		
		allMaster.forEach(t ->{
			
			List<CodeSlaveVO> slaves = allSlave.stream().filter(t2 ->{return t2.getMasterCode().equals(t);}).sorted().collect(Collectors.toList());
			
			Map<String, List<CodeRO>> langCodeMap = new HashMap<>();
			
			langCodes.forEach(l ->{
				List<CodeRO> codeList = new ArrayList<>();
				
				slaves.forEach(t2->{
					CodeSlaveInfoVO info = allSlaveInfo.stream().filter(t3 ->{return t3.getMasterCode().equals(t) && t3.getSlaveCode().equals(t2.getSlaveCode()) && t3.getCodeLangType().equals(l.getSlaveCode());}).findFirst().orElse(null);
					
					CodeRO result = new CodeRO();
					result.setSlaveCode(t2.getSlaveCode());
					if(info == null){
						result.setCodeName(t2.getSlaveCodeName());
					}else{
						result.setCodeName(info.getInfoName());
					}
					codeList.add(result);
				});
				
				langCodeMap.put(l.getSlaveCode(), codeList);
			});
			
			codeMap.put(t, langCodeMap);
			
		});
	}
	
	/**
	 * @param masterCode 마스터 코드
	 * @param langCode 언어코드
	 * @return 코드 리스트
	 */
	public List<CodeRO> findCodeList(final String masterCode, final String langCode){
		if(codeMap == null || codeMap.size() == 0){
			initCodes();
		}
		
		return codeMap.get(masterCode).get(langCode);
	}
	
	/**
	 * @param masterCode 마스터 코드
	 * @param subCodes 값이 필요한 하위 코드들
	 * @param langCode 언어코드
	 * @return 코드 리스트
	 */
	public List<CodeRO> findCodeList(final String masterCode, final List<String> subCodes, final String langCode){
		
		List<CodeRO> result = this.findCodeList(masterCode, langCode);
		
		return result.stream().filter(t -> {return subCodes.contains(t.getSlaveCode());}).collect(Collectors.toList());
	}

}
