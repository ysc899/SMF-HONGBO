package com.seegene.web.admin.main.logo.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 로고 등록 기본 정보
 */
@Data
public class MainLogoAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	/** 타입 구분 코드 */
	private List<CodeSlaveRO> typeCodes;
	
}
