package com.seegene.web.admin.main.rolling.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 롤링 등록 기본 정보
 */
@Data
public class MainRollingAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	
}
