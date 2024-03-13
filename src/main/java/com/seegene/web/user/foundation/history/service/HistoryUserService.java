package com.seegene.web.user.foundation.history.service;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.repository.mariadb.HistoryMapper;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.code.vo.CodeRO;
import com.seegene.web.user.foundation.history.vo.HistorySearchPO;
import com.seegene.web.user.foundation.history.vo.HistoryUserDefaultRO;
import com.seegene.web.user.foundation.history.vo.HistoryUserResultRO;

@Service
public class HistoryUserService {
	
	@Autowired
	private HistoryMapper mapper;
	
	
	@Autowired
	private UserCodeService codeService;

	
	public HistoryUserDefaultRO getDefaultInfo(final Locale locale){
		
		HistoryUserDefaultRO item = new HistoryUserDefaultRO();
		
		List<CodeRO> codes = codeService.findCodeList("historyTY", locale.getLanguage());
		
		item.setT1Start(codes.stream().filter(t ->{return t.getSlaveCode().equals("t1Start");}).findFirst().orElse(null));
		item.setT1End(codes.stream().filter(t ->{return t.getSlaveCode().equals("t1End");}).findFirst().orElse(null));
		
		item.setT2Start(codes.stream().filter(t ->{return t.getSlaveCode().equals("t2Start");}).findFirst().orElse(null));
		item.setT2End(codes.stream().filter(t ->{return t.getSlaveCode().equals("t2End");}).findFirst().orElse(null));
		
		item.setT3Start(codes.stream().filter(t ->{return t.getSlaveCode().equals("t3Start");}).findFirst().orElse(null));
		item.setT3End(codes.stream().filter(t ->{return t.getSlaveCode().equals("t3End");}).findFirst().orElse(null));
		
		item.setT4Start(codes.stream().filter(t ->{return t.getSlaveCode().equals("t4Start");}).findFirst().orElse(null));
		item.setT4End(codes.stream().filter(t ->{return t.getSlaveCode().equals("t4End");}).findFirst().orElse(null));
		
		return item;
	}
	
	public HistoryUserResultRO getData(final Locale locale, final HistorySearchPO param){
		
		param.setCodeLangType(locale.getLanguage());
		
		HistoryUserResultRO result = new HistoryUserResultRO();
		
		result.setHitstoryByYears( mapper.findUserHitstoryByYears(param));
		result.setYearInfos( mapper.findUserYearInfoByYears(param));
		
		return result;
	}
}
