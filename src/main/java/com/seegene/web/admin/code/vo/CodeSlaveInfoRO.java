package com.seegene.web.admin.code.vo;

import lombok.Data;

/**
 * 자식 코드 다국어 설명
 */
@Data
public class CodeSlaveInfoRO extends CodeSlaveInfoVO{

	/** 언어 타입 코드 */
	private String codeLangName;

	/** 최종 수정한 사용자 */
	private String editUserName;

}
