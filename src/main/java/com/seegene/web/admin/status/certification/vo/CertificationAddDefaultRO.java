package com.seegene.web.admin.status.certification.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 인증현황 등록 기본 정보
 */
@Data
public class CertificationAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	/** 카테고리 구분 코드 */
	private List<CodeSlaveRO> categoryCodes;
	/** 센터 구분 코드 */
	private List<CodeSlaveRO> centerCodes;
	/** 국내외 구분 코드 */
	private List<CodeSlaveRO> certLocCodes;
	
	
}
