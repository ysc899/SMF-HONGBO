package com.seegene.web.admin.code.vo;

import lombok.Data;

/**
 * 코드 다국어 정보 수정용 파라미터
 */
@Data
public class CodeEditSlaveInfoPO {
	/** 식별자 */
	private int seq;
	/** 언어코드 */
	private String codeLangType;
	/** 언어코드 명 */
	private String codeLangName;
	/** 다국어용 데이터 */
	private String infoName;
}
