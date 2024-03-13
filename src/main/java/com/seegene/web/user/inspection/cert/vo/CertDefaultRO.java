package com.seegene.web.user.inspection.cert.vo;

import java.util.List;

import com.seegene.web.user.code.vo.CodeRO;

import lombok.Data;

/**
 * 인증현황에 기본적으로 필요한 데이터
 */
@Data
public class CertDefaultRO {

	/** 센터2 분류 코드 */
	private List<CodeRO> centerCodes;
	/** 인증현황 분류 코드 */
	private List<CodeRO> certCodes;
	
	private List<CodeRO> certLocCodes;
}
